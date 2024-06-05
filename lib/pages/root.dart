import 'package:flutter/material.dart';
import 'package:proyecto_flutter/pages/home.dart';
import 'package:proyecto_flutter/pages/settings.dart';

class Destination {
  const Destination(this.index, this.name, this.icon);
  final int index;
  final String name;
  final IconData icon;
}

final List<Widget> views = [MyHomePage(), SettingsPage()];

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  static const List<Destination> allDestinations = <Destination>[
    Destination(0, 'Inicio', Icons.home_rounded),
    Destination(1, 'Preferencias', Icons.settings_rounded)
  ];

  int currentView = 0;

  PreferredSizeWidget buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    if (currentView == 0) {
      return AppBar(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        centerTitle: true,
        title: Text(
          "Gestor de gastos",
          style:
              theme.textTheme.titleLarge?.apply(color: colorScheme.onPrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      );
    }
    return AppBar(
      foregroundColor: colorScheme.onPrimary,
      backgroundColor: colorScheme.primary,
    );
  }

  Widget? buildFloatingActionButton(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (currentView == 0) {
      return FloatingActionButton(
          backgroundColor: colorScheme.surfaceVariant,
          onPressed: () {
            Navigator.pushNamed(context, '/create-transaction');
          },
          child: const Icon(Icons.edit_outlined));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: buildAppBar(context),
      body: SizedBox(
        width: minWidth,
        child: views[currentView],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentView,
        onDestinationSelected: (int index) {
          setState(() {
            currentView = index;
          });
        },
        destinations: allDestinations
            .map<NavigationDestination>((Destination destination) {
          return NavigationDestination(
              icon: Icon(destination.icon), label: destination.name);
        }).toList(),
      ),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }
}
