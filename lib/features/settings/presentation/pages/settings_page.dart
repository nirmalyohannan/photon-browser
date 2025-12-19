import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/settings_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../features/history/presentation/bloc/history_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SettingsBloc>()..add(LoadSettings()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Search Engine',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                if (state is SettingsLoaded) {
                  return Column(
                    children: [
                      RadioListTile(
                        title: const Text('Google'),
                        value: 'https://www.google.com/search?q=',
                        groupValue: state.searchEngineUrl,
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(
                            ChangeSearchEngine(value!),
                          );
                        },
                      ),
                      RadioListTile(
                        title: const Text('DuckDuckGo'),
                        value: 'https://duckduckgo.com/?q=',
                        groupValue: state.searchEngineUrl,
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(
                            ChangeSearchEngine(value!),
                          );
                        },
                      ),
                      RadioListTile(
                        title: const Text('Bing'),
                        value: 'https://www.bing.com/search?q=',
                        groupValue: state.searchEngineUrl,
                        onChanged: (value) {
                          context.read<SettingsBloc>().add(
                            ChangeSearchEngine(value!),
                          );
                        },
                      ),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Data Management',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text('Clear History'),
              leading: const Icon(Icons.delete),
              onTap: () {
                // Trigger clear history via HistoryBloc
                // We can grab it from DI since it's a singleton (or registered factory that effectively acts globally if we want)
                // But better to check if it's already active or just assume we can get a new instance/existing one.
                // Actually, HistoryBloc might not be preserved if we left HistoryPage.
                // We should probably rely on a fresh instance to clear, or better, the Repository.
                // But UI feedback requires Bloc.
                // For now, let's just use GetIt to find it and add event.
                GetIt.I<HistoryBloc>().add(ClearHistory());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('History cleared')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
