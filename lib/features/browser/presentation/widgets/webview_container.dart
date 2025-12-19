import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../domain/entities/browser_tab.dart';
import '../bloc/browser_bloc.dart';
import '../bloc/browser_event.dart';
import '../bloc/browser_state.dart';
import '../pages/home_page.dart';

class WebViewContainer extends StatefulWidget {
  final BrowserTab tab;

  const WebViewContainer({super.key, required this.tab});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer>
    with AutomaticKeepAliveClientMixin {
  InAppWebViewController? _webViewController;

  @override
  bool get wantKeepAlive => true; // Keep tab alive when switched away

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<BrowserBloc, BrowserState>(
      listenWhen: (previous, current) {
        // Listen if this tab's URL changed in state AND it matches our ID
        final prevTab = previous.tabs.firstWhere(
          (t) => t.id == widget.tab.id,
          orElse: () => widget.tab,
        );
        final currTab = current.tabs.firstWhere(
          (t) => t.id == widget.tab.id,
          orElse: () => widget.tab,
        );
        return prevTab.url != currTab.url;
      },
      listener: (context, state) async {
        final tab = state.tabs.firstWhere(
          (t) => t.id == widget.tab.id,
          orElse: () => widget.tab,
        );
        if (_webViewController != null) {
          final currentUrl = await _webViewController!.getUrl();
          if (currentUrl.toString() != tab.url) {
            _webViewController?.loadUrl(
              urlRequest: URLRequest(url: WebUri(tab.url)),
            );
          }
        }
      },
      child: widget.tab.url == 'about:blank'
          ? HomePage(tabId: widget.tab.id)
          : InAppWebView(
              key: ValueKey(widget.tab.id),
              initialUrlRequest: URLRequest(url: WebUri(widget.tab.url)),
              initialSettings: InAppWebViewSettings(
                isInspectable: kDebugMode,
                incognito: widget.tab.isIncognito,
                useHybridComposition: true, // Better for Android type input
              ),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onLoadStart: (controller, url) {
                if (url != null) {
                  // We update Bloc, but we should distinguish "Browser navigated" vs "User requested navigation".
                  // If Browser navigated, we update URL in Bloc.
                  context.read<BrowserBloc>().add(
                    BrowserUrlChanged(
                      tabId: widget.tab.id,
                      url: url.toString(),
                    ),
                  );
                }
              },
              onLoadStop: (controller, url) async {
                if (url != null) {
                  context.read<BrowserBloc>().add(
                    BrowserUrlChanged(
                      tabId: widget.tab.id,
                      url: url.toString(),
                    ),
                  );
                }
                final title = await controller.getTitle();
                if (title != null) {
                  context.read<BrowserBloc>().add(
                    BrowserTitleChanged(tabId: widget.tab.id, title: title),
                  );
                }
                // TODO: Update favicon
              },
              onTitleChanged: (controller, title) {
                if (title != null) {
                  context.read<BrowserBloc>().add(
                    BrowserTitleChanged(tabId: widget.tab.id, title: title),
                  );
                }
              },
            ),
    );
  }
}
