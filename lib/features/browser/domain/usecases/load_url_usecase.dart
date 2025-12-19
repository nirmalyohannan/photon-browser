import 'package:injectable/injectable.dart';

@lazySingleton
class LoadUrlUseCase {
  /// Transforms user input into a valid URL or Search Query.
  String call(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) return 'about:blank';

    final uri = Uri.tryParse(trimmed);
    final hasScheme = uri?.hasScheme ?? false;
    // Simple heuristic: if it has a space or no dot, it's likely a search query.
    // Ideally we reference a TLD list, but this is a starter.
    final hasDot = trimmed.contains('.');
    final hasSpace = trimmed.contains(' ');

    if (hasSpace || !hasDot) {
      // Treat as search query.
      // TODO: Support different search engines via SettingsRepository
      return 'https://www.google.com/search?q=${Uri.encodeComponent(trimmed)}';
    }

    if (!hasScheme) {
      // Default to https
      return 'https://$trimmed';
    }

    return trimmed;
  }
}
