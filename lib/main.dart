import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/pages/create_transaction.dart';
import 'package:proyecto_flutter/pages/root.dart';
import 'package:proyecto_flutter/providers/create_transaction_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CreateTransactionProvider()),
    ],
    child: const MyApp(),
  ));
}

Map<String, WidgetBuilder> routes = {
  '/': (context) => const RootPage(),
  '/create-transaction': (context) => const CreateTransaction()
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
