import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/browser_bloc.dart';
import '../bloc/browser_event.dart';
import '../bloc/browser_state.dart';

class TabSwitcherPage extends StatelessWidget {
  const TabSwitcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        await SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text('Tabs'),
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<BrowserBloc>().add(const BrowserTabCreated());
                Navigator.pop(context); // Go back to browser with new tab
              },
            ),
          ],
        ),
        body: BlocBuilder<BrowserBloc, BrowserState>(
          builder: (context, state) {
            if (state.tabs.isEmpty) {
              return const Center(
                child: Text('No tabs', style: TextStyle(color: Colors.white)),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: state.tabs.length,
              itemBuilder: (context, index) {
                final tab = state.tabs[index];
                final isActive = index == state.activeTabIndex;

                return GestureDetector(
                  onTap: () {
                    context.read<BrowserBloc>().add(BrowserTabSelected(tab.id));
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: isActive
                          ? Border.all(color: Colors.blue, width: 3)
                          : null,
                    ),
                    child: Column(
                      children: [
                        // Header (Favicon + Title + Close)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          child: Row(
                            children: [
                              // Favicon
                              if (tab.favicon != null &&
                                  tab.favicon!.isNotEmpty)
                                Image.memory(
                                  tab.favicon!,
                                  width: 16,
                                  height: 16,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        width: 16,
                                        height: 16,
                                        color: Colors.grey,
                                      ),
                                )
                              else
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  tab.title.isEmpty ? 'New Tab' : tab.title,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                    color:
                                        Colors.black, // Ensure text is visible
                                    decoration:
                                        TextDecoration.none, // Fix Hero text
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<BrowserBloc>().add(
                                    BrowserTabClosed(tab.id),
                                  );
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Content Placeholder (Screenshot)
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: tab.screenshotPath != null
                                ? Image.file(
                                    File(tab.screenshotPath!),
                                    fit: BoxFit.cover,
                                    key: ValueKey(
                                      tab.screenshotPath,
                                    ), // Force refresh if path changes
                                    errorBuilder: (_, __, ___) => const Center(
                                      child: Icon(
                                        Icons.broken_image,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      tab.url,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        decoration: TextDecoration.none,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
