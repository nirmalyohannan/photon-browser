import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../downloads/presentation/pages/downloads_page.dart';
import '../../../history/presentation/pages/history_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../bloc/browser_bloc.dart';
import '../bloc/browser_state.dart';
import '../bloc/browser_event.dart';
import '../widgets/omnibox.dart';
import '../widgets/webview_container.dart';
import 'tab_switcher_page.dart';

class BrowserPage extends StatelessWidget {
  const BrowserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BrowserView();
  }
}

class BrowserView extends StatelessWidget {
  const BrowserView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        final activeTab = context.read<BrowserBloc>().state.activeTab;
        if (activeTab?.canGoBack ?? false) {
          context.read<BrowserBloc>().add(const BrowserGoBack());
        } else {
          // Trigger screenshot logic before leaving?
          // Ideally we should but simpler to just navigate for now.
          // Or we can reuse the screenshot logic from the button.
          // For now, straight push.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TabSwitcherPage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<BrowserBloc, BrowserState>(
            buildWhen: (previous, current) =>
                previous.tabs != current.tabs ||
                previous.activeTabIndex != current.activeTabIndex,
            builder: (context, state) {
              return Column(
                children: [
                  // Tabs / Content
                  Expanded(
                    child: state.tabs.isEmpty
                        ? const Center(child: Text('No Tabs'))
                        : IndexedStack(
                            index: state.activeTabIndex,
                            children: state.tabs
                                .map((tab) => WebViewContainer(tab: tab))
                                .toList(),
                          ),
                  ),
                  // Bottom Bar (OmniBox + Controls)
                  const OmniBox(),
                  _buildBottomBar(context, state),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, BrowserState state) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: (state.activeTab?.canGoBack ?? false)
                  ? Colors.black
                  : Colors.grey,
            ),
            onPressed: (state.activeTab?.canGoBack ?? false)
                ? () {
                    context.read<BrowserBloc>().add(const BrowserGoBack());
                  }
                : null,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: (state.activeTab?.canGoForward ?? false)
                  ? Colors.black
                  : Colors.grey,
            ),
            onPressed: (state.activeTab?.canGoForward ?? false)
                ? () {
                    context.read<BrowserBloc>().add(const BrowserGoForward());
                  }
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Focus OmniBox or open Search
            },
          ),
          // Tab Switcher Button
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 24,
                height: 24,
                alignment: Alignment.center,
                child: Text(
                  state.tabs.length.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      // Trigger screenshot logic
                      final activeTabId = state.activeTab?.id;
                      if (activeTabId != null) {
                        context.read<BrowserBloc>().add(
                          BrowserCaptureScreenshot(activeTabId),
                        );
                        // Short delay to allow screenshot to be captured and saved
                        // This ensures the Hero animation has a valid image source
                        await Future.delayed(const Duration(milliseconds: 100));
                      }

                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TabSwitcherPage(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),

          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _showMenu(context);
            },
          ),
        ],
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('History'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HistoryPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.download),
                title: const Text('Downloads'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DownloadsPage()),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsPage()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
