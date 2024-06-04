import 'package:flutter/material.dart';
import 'package:proyecto_flutter/pages/home.dart';
import 'package:proyecto_flutter/pages/settings.dart';

void main() {
  runApp(const MyApp());
}

Map<String, WidgetBuilder> routes = {
  '/': (context) => const MyHomePage(),
  '/settings': (context) => const SettingsPage()
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Gastos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(0, 184, 217, 1),
        ),
        useMaterial3: true,
      ),
      routes: routes,
    );
  }
}
