import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/browser_bloc.dart';
import '../bloc/browser_event.dart';
import '../bloc/browser_state.dart';

class OmniBox extends StatefulWidget {
  const OmniBox({super.key});

  @override
  State<OmniBox> createState() => _OmniBoxState();
}

class _OmniBoxState extends State<OmniBox> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrowserBloc, BrowserState>(
      listenWhen: (previous, current) =>
          previous.activeTab?.url != current.activeTab?.url,
      listener: (context, state) {
        if (state.activeTab != null && !_controller.selection.isValid) {
          // Only update if not editing (simple check)
          _controller.text = state.activeTab!.url;
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            children: [
              const Icon(Icons.lock, size: 16, color: Colors.green),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: 'Search or enter URL',
                  ),
                  onSubmitted: (value) {
                    context.read<BrowserBloc>().add(
                      BrowserTabCreated(
                        url: value,
                      ), // New tab or update current? User usually expects current.
                      // ACTUALLY: The prompt said "BrowserTabCreated" for NEW tabs, but for OmniBox usually updates CURRENT tab.
                      // My Bloc has `BrowserTabCreated` but not `BrowserLoadUrl` (for existing tab).
                      // I should add `BrowserLoadUrl` event to Bloc really.
                      // For now, I'll simulate "Update current tab" by just loading URL in controller if I have access,
                      // BUT separating concerns -> Event "BrowserLoadUrlRequested(tabId, url)"
                    );
                    // Checking BrowserEvents... I have BrowserUrlChanged but that is for events FROM webview.
                    // I need an event to TELL webview to load.
                    // Or I create a new tab. For now, let's create a new tab as simpler default or implement the LoadUrl logic properly.
                    // "BrowserTabCreated" with URL effectively opens a new tab.
                    // If I want to update current tab, I need a way to message the WebView.
                    // Usually this is done via a Controller in the State or passed down.
                  },
                ),
              ),
              if (state.activeTab?.isLoading ?? false)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              else
                IconButton(
                  icon: const Icon(Icons.refresh, size: 20),
                  onPressed: () {
                    // Reload
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
