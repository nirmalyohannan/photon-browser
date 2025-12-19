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
  final String? faviconUrl;

  const BrowserFaviconChanged({required this.tabId, this.faviconUrl});

  @override
  List<Object?> get props => [tabId, faviconUrl];
}

class BrowserPageLoaded extends BrowserEvent {
  final String tabId;

  const BrowserPageLoaded(this.tabId);

  @override
  List<Object?> get props => [tabId];
}

class BrowserLoadUrl extends BrowserEvent {
  final String url;
  final String? tabId; // If null, active tab

  const BrowserLoadUrl({required this.url, this.tabId});

  @override
  List<Object?> get props => [url, tabId];
}
