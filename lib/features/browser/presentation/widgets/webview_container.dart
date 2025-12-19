import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/entities/browser_tab.dart';
import '../../../downloads/presentation/bloc/downloads_bloc.dart';
import '../../../downloads/presentation/bloc/downloads_event.dart';
import '../../../downloads/presentation/widgets/download_dialog.dart';
import '../bloc/browser_bloc.dart';
import '../bloc/browser_event.dart';
import '../bloc/browser_state.dart';
import '../pages/home_page.dart';
import '../../../history/presentation/bloc/history_bloc.dart';
import 'package:get_it/get_it.dart';

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
          if (state.navigationTargetTabId == widget.tab.id &&
              state.navigationAction != BrowserNavigationAction.none) {
            if (state.navigationAction == BrowserNavigationAction.goBack) {
              _webViewController?.goBack();
            } else if (state.navigationAction ==
                BrowserNavigationAction.goForward) {
              _webViewController?.goForward();
            }
            // Reset action? Bloc handles it via BrowserNavigationConsumed?
            // No, we can't dispatch event here easily without risk of infinite loop if we rely on state change.
            // But BrowserBloc has `BrowserNavigationConsumed` event.
            // If we dispatch it, Bloc resets state.
            // Only dispatch if we actually acted.
            context.read<BrowserBloc>().add(const BrowserNavigationConsumed());
          }

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
                  // Add to history
                  if (url != null && url.toString() != 'about:blank') {
                    GetIt.I<HistoryBloc>().add(
                      AddHistoryEntry(url: url.toString(), title: title),
                    );
                  }
                }
                // Update favicon
                if (url != null) {
                  // We might get favicon here if we want to fetch it manually,
                  // but onReceivedIcon is better.
                }
              },
              onReceivedIcon: (controller, icon) {
                context.read<BrowserBloc>().add(
                  BrowserFaviconChanged(tabId: widget.tab.id, favicon: icon),
                );
              },
              onTitleChanged: (controller, title) {
                if (title != null) {
                  context.read<BrowserBloc>().add(
                    BrowserTitleChanged(tabId: widget.tab.id, title: title),
                  );
                }
              },
              onDownloadStartRequest: (controller, request) async {
                final url = request.url.toString();
                final suggestedFilename =
                    request.suggestedFilename ?? 'download';

                // Get default download directory
                Directory? dir;
                if (defaultTargetPlatform == TargetPlatform.android) {
                  dir = Directory('/storage/emulated/0/Download');
                  if (!dir.existsSync()) {
                    dir = await getDownloadsDirectory();
                  }
                } else {
                  dir = await getDownloadsDirectory();
                }

                final downloadPath =
                    dir?.path ??
                    (await getApplicationDocumentsDirectory()).path;

                final result = await showDialog<String>(
                  context: context,
                  builder: (context) => DownloadDialog(
                    url: url,
                    suggestedFilename: suggestedFilename,
                    downloadPath: downloadPath,
                  ),
                );

                if (result != null && mounted) {
                  context.read<DownloadsBloc>().add(
                    StartDownload(url: url, filename: result),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Downloading $result...')),
                  );
                }
              },
            ),
    );
  }
}
