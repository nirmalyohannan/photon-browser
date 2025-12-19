import 'package:injectable/injectable.dart';
import '../entities/browser_tab.dart';

@lazySingleton
class CloseTabUseCase {
  /// Returns the new list of tabs after closing [tabId].
  /// Does NOT handle disposing resources (WebView), that should be done by the Presentation/Reference holder.
  List<BrowserTab> call(List<BrowserTab> tabs, String tabId) {
    return tabs.where((t) => t.id != tabId).toList();
  }
}
