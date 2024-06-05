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

  buildFloatingActionButton() {
    if (currentView == 0) {
      return FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create-transaction');
          },
          child: const Icon(Icons.add));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      appBar: AppBar(
        foregroundColor: theme.colorScheme.onPrimary,
        backgroundColor: theme.colorScheme.primary,
      ),
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
      floatingActionButton: buildFloatingActionButton(),
    );
  }
}
