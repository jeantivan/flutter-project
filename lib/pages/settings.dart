import 'package:flutter/material.dart';
import 'package:proyecto_flutter/widget/layout.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      child: Center(
        child: Text("Settings page"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
