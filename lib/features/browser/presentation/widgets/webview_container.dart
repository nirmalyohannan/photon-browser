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
        return previous.tabs != current.tabs ||
            previous.navigationTargetTabId != current.navigationTargetTabId ||
            previous.navigationAction != current.navigationAction ||
            previous.captureScreenshotTabId != current.captureScreenshotTabId;
      },
      listener: (context, state) async {
        final tab = state.tabs.firstWhere(
          (t) => t.id == widget.tab.id,
          orElse: () => widget.tab,
        );

        // Handle Screenshot Capture
        if (state.captureScreenshotTabId == widget.tab.id) {
          if (_webViewController != null) {
            try {
              final screenshot = await _webViewController!.takeScreenshot(
                screenshotConfiguration: ScreenshotConfiguration(
                  compressFormat: CompressFormat.JPEG,
                  quality: 50, // Optimize size
                ),
              );
              if (screenshot != null) {
                final dir = await getApplicationDocumentsDirectory();
                final path = '${dir.path}/tab_screenshot_${widget.tab.id}.jpg';
                final file = File(path);
                await file.writeAsBytes(screenshot);

                if (mounted) {
                  context.read<BrowserBloc>().add(
                    BrowserScreenshotUpdated(tabId: widget.tab.id, path: path),
                  );
                }
              }
            } catch (e) {
              debugPrint('Screenshot capture failed: $e');
            }
          }
          // We don't need to explicitly consume here if we switch state or if relying on "change" is enough.
          // But to be safe, maybe we should? For now, we rely on the event causing a state change (screenshot updated)
          // which might trigger this again if we are not careful?
          // No, because captureScreenshotTabId won't change in that event.
          // So listenWhen `previous.captureScreenshotTabId != current.captureScreenshotTabId` protects us.
          // But wait, if I ask for capture (ID=A), listener fires.
          // Then I update screenshot (ID=A), listener fires again?
          // previous.captureScreenshotTabId (A) == current.captureScreenshotTabId (A). Logic returns false. Safe.
        }

        if (_webViewController != null && tab.url.isNotEmpty) {
          final currentUrl = await _webViewController!.getUrl();
          // Navigation Logic
          if (state.navigationTargetTabId == widget.tab.id &&
              state.navigationAction != BrowserNavigationAction.none) {
            if (state.navigationAction == BrowserNavigationAction.goBack) {
              _webViewController?.goBack();
            } else if (state.navigationAction ==
                BrowserNavigationAction.goForward) {
              _webViewController?.goForward();
            }
            context.read<BrowserBloc>().add(const BrowserNavigationConsumed());
          }

          if (currentUrl != null && currentUrl.toString() != tab.url) {
            // Only load if it's a real change and not just a fragment or we are not loading?
            // Actually validation here is tricky.
            // Best to rely on Bloc's URL.
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
              onUpdateVisitedHistory: (controller, url, androidIsReload) async {
                final canGoBack = await controller.canGoBack();
                final canGoForward = await controller.canGoForward();
                if (mounted) {
                  context.read<BrowserBloc>().add(
                    BrowserHistoryUpdated(
                      tabId: widget.tab.id,
                      canGoBack: canGoBack,
                      canGoForward: canGoForward,
                    ),
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
