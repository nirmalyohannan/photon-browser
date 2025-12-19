import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/history_bloc.dart';
import 'package:get_it/get_it.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<HistoryBloc>()..add(LoadHistory()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          actions: [
            BlocBuilder<HistoryBloc, HistoryState>(
              builder: (context, state) {
                if (state is HistoryLoaded && state.history.isNotEmpty) {
                  return IconButton(
                    icon: const Icon(Icons.delete_sweep),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Clear History'),
                          content: const Text(
                            'Are you sure you want to clear all history?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Need to access the bloc from the context of the page, not the dialog
                                // But since we are inside BlocBuilder which is inside BlocProvider, we can use context.read
                                // However, the dialog has its own context. We need to capture the bloc.
                                final bloc = context.read<HistoryBloc>();
                                bloc.add(ClearHistory());
                                Navigator.pop(context);
                              },
                              child: const Text('Clear'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        body: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state is HistoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HistoryLoaded) {
              if (state.history.isEmpty) {
                return const Center(child: Text('No history yet'));
              }
              return ListView.builder(
                itemCount: state.history.length,
                itemBuilder: (context, index) {
                  final entry = state.history[index];
                  return ListTile(
                    leading: const Icon(Icons.history),
                    title: Text(
                      entry.title.isNotEmpty ? entry.title : entry.url,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.url,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          DateFormat.yMMMd().add_jm().format(entry.timestamp),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.close, size: 16),
                      onPressed: () {
                        context.read<HistoryBloc>().add(
                          DeleteHistoryEntry(entry.id),
                        );
                      },
                    ),
                    onTap: () {
                      // TODO: Navigate to this URL (return results to caller or use navigator)
                      // For now, we assume this page is pushed on top of browser
                    },
                  );
                },
              );
            } else if (state is HistoryError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
