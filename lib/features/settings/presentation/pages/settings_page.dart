import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.shield),
            title: Text('Privacy'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('Appearance'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }
}
