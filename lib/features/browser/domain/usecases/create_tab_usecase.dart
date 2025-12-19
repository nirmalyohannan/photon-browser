import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../entities/browser_tab.dart';

@lazySingleton
class CreateTabUseCase {
  final Uuid _uuid;

  CreateTabUseCase(this._uuid);

  BrowserTab call({String? url, bool isIncognito = false}) {
    return BrowserTab(
      id: _uuid.v4(),
      url: url ?? 'about:blank',
      title: 'New Tab',
      isIncognito: isIncognito,
    );
  }
}
