import 'package:injectable/injectable.dart';
import '../../../settings/domain/repositories/settings_repository.dart';

@lazySingleton
class LoadUrlUseCase {
  final SettingsRepository _settingsRepository;

  LoadUrlUseCase(this._settingsRepository);

  /// Transforms user input into a valid URL or Search Query.
  Future<String> call(String input) async {
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
      final searchUrl = await _settingsRepository.getSearchEngineUrl();
      return '$searchUrl${Uri.encodeComponent(trimmed)}';
    }

    if (!hasScheme) {
      // Default to https
      return 'https://$trimmed';
    }

    return trimmed;
  }
}
