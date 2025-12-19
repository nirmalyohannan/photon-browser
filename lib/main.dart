import 'package:flutter/material.dart';
import 'core/di/injection.dart';
import 'features/browser/presentation/pages/browser_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const PhotonApp());
}

class PhotonApp extends StatelessWidget {
  const PhotonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photon Browser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const BrowserPage(),
    );
  }
}
