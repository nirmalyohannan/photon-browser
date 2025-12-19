import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// ignore: uri_does_not_exist
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  await getIt.init();
}
