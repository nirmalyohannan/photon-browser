import 'dart:typed_data';
import 'package:equatable/equatable.dart';

abstract class BrowserEvent extends Equatable {
  const BrowserEvent();

  @override
  List<Object?> get props => [];
}

class BrowserInitialized extends BrowserEvent {}

class BrowserTabCreated extends BrowserEvent {
  final String? url;
  final bool isIncognito;

  const BrowserTabCreated({this.url, this.isIncognito = false});

  @override
  List<Object?> get props => [url, isIncognito];
}

class BrowserTabClosed extends BrowserEvent {
  final String tabId;

  const BrowserTabClosed(this.tabId);

  @override
  List<Object?> get props => [tabId];
}

class BrowserTabSelected extends BrowserEvent {
  final String tabId;

  const BrowserTabSelected(this.tabId);

  @override
  List<Object?> get props => [tabId];
}

class BrowserLoadUrl extends BrowserEvent {
  final String url;
  final String? tabId;

  const BrowserLoadUrl({required this.url, this.tabId});

  @override
  List<Object?> get props => [url, tabId];
}

class BrowserUrlChanged extends BrowserEvent {
  final String tabId;
  final String url;

  const BrowserUrlChanged({required this.tabId, required this.url});

  @override
  List<Object?> get props => [tabId, url];
}

class BrowserTitleChanged extends BrowserEvent {
  final String tabId;
  final String title;

  const BrowserTitleChanged({required this.tabId, required this.title});

  @override
  List<Object?> get props => [tabId, title];
}

class BrowserFaviconChanged extends BrowserEvent {
  final String tabId;
  final Uint8List? favicon;

  const BrowserFaviconChanged({required this.tabId, required this.favicon});

  @override
  List<Object?> get props => [tabId, favicon];
}

class BrowserGoBack extends BrowserEvent {
  final String? tabId;
  const BrowserGoBack({this.tabId});
}

class BrowserGoForward extends BrowserEvent {
  final String? tabId;
  const BrowserGoForward({this.tabId});
}

class BrowserNavigationConsumed extends BrowserEvent {
  const BrowserNavigationConsumed();
}

class BrowserScreenshotUpdated extends BrowserEvent {
  final String tabId;
  final String path;

  const BrowserScreenshotUpdated({required this.tabId, required this.path});

  @override
  List<Object?> get props => [tabId, path];
}

class BrowserHistoryUpdated extends BrowserEvent {
  final String tabId;
  final bool canGoBack;
  final bool canGoForward;

  const BrowserHistoryUpdated({
    required this.tabId,
    required this.canGoBack,
    required this.canGoForward,
  });

  @override
  List<Object?> get props => [tabId, canGoBack, canGoForward];
}

class BrowserCaptureScreenshot extends BrowserEvent {
  final String tabId;

  const BrowserCaptureScreenshot(this.tabId);

  @override
  List<Object?> get props => [tabId];
}
