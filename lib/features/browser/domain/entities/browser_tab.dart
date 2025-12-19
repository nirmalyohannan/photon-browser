import 'dart:typed_data';
import 'package:equatable/equatable.dart';

class BrowserTab extends Equatable {
  final String id;
  final String url;
  final String title;
  final bool isIncognito;
  final double scrollPosition;
  final bool isLoading;
  final String? faviconUrl;
  // Screenshot is often heavy, keep it out of the domain model if possible,
  // or nullable and not persisted tightly. But for tab switcher we need it.
  // We can store a path or bytes. Bytes is easier for in-memory.
  final Uint8List? screenshot;

  const BrowserTab({
    required this.id,
    required this.url,
    this.title = '',
    this.isIncognito = false,
    this.scrollPosition = 0.0,
    this.isLoading = false,
    this.faviconUrl,
    this.screenshot,
  });

  BrowserTab copyWith({
    String? id,
    String? url,
    String? title,
    bool? isIncognito,
    double? scrollPosition,
    bool? isLoading,
    String? faviconUrl,
    Uint8List? screenshot,
  }) {
    return BrowserTab(
      id: id ?? this.id,
      url: url ?? this.url,
      title: title ?? this.title,
      isIncognito: isIncognito ?? this.isIncognito,
      scrollPosition: scrollPosition ?? this.scrollPosition,
      isLoading: isLoading ?? this.isLoading,
      faviconUrl: faviconUrl ?? this.faviconUrl,
      screenshot: screenshot ?? this.screenshot,
    );
  }

  @override
  List<Object?> get props => [
    id,
    url,
    title,
    isIncognito,
    scrollPosition,
    isLoading,
    faviconUrl,
    screenshot,
  ];
}
