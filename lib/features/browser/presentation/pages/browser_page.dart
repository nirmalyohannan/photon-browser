import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../bloc/browser_bloc.dart';
import '../bloc/browser_state.dart';
import '../widgets/omnibox.dart';
import '../widgets/webview_container.dart';

class BrowserPage extends StatelessWidget {
  const BrowserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BrowserBloc>(),
      child: const BrowserView(),
    );
  }
}

class BrowserView extends StatelessWidget {
  const BrowserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Tabs / Content
            Expanded(
              child: BlocBuilder<BrowserBloc, BrowserState>(
                buildWhen: (previous, current) =>
                    previous.tabs != current.tabs ||
                    previous.activeTabIndex != current.activeTabIndex,
                builder: (context, state) {
                  if (state.tabs.isEmpty) {
                    return const Center(child: Text('No Tabs'));
                  }
                  // Identify active tab
                  // We use IndexedStack to keep state, or just switch.
                  // For a real browser, we want to keep WebViews alive.
                  // But creating N WebViews is heavy.
                  // Usually standard practice is to keep a few or just the active one + adjacent.
                  // For MVP, let's use IndexedStack but it instantiates all.
                  // Better: A Stack with Offstage, or just render the active one if we don't care about background reload.
                  // But requirement says "Tab Management... Tabs must persist their state".
                  // So IndexedStack is simplest for "persist state in memory".

                  return IndexedStack(
                    index: state.activeTabIndex,
                    children: state.tabs
                        .map((tab) => WebViewContainer(tab: tab))
                        .toList(),
                  );
                },
              ),
            ),
            // Bottom Bar (OmniBox + Controls)
            const OmniBox(),
          ],
        ),
      ),
    );
  }
}
