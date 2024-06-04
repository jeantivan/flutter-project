import 'package:flutter/material.dart';
import 'package:proyecto_flutter/pages/home.dart';
import 'package:proyecto_flutter/pages/settings.dart';

class Destination {
  final int index;
  final String name;
  final IconData icon;

  const Destination(this.index, this.name, this.icon);
}

class DestinationView extends StatefulWidget {
  const DestinationView({super.key, required this.navigatorKey});

  final Key navigatorKey;

  @override
  State<DestinationView> createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              switch (settings.name) {
                case '/':
                  return const MyHomePage();
                case '/preferencias':
                  return const SettingsPage();
              }
              assert(false);

              return const SizedBox();
            });
      },
    );
  }
}

class Layout extends StatefulWidget {
  final Widget child;
  final Widget? floatingActionButton;
  const Layout({super.key, required this.child, this.floatingActionButton});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  static const List<Destination> allDestinations = [
    Destination(0, 'Inicio', Icons.home_rounded),
    Destination(1, 'Preferencias', Icons.settings_rounded)
  ];

  late final List<GlobalKey<NavigatorState>> navigatorKeys;
  late final List<GlobalKey> destinationKeys;
  late final List<Widget> destinationViews;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        allDestinations.length, (index) => GlobalKey()).toList();

    destinationViews = allDestinations.map<Widget>((Destination destination) {
      return DestinationView(navigatorKey: navigatorKeys[destination.index]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return NavigatorPopHandler(
        onPop: () {
          final NavigatorState navigator =
              navigatorKeys[currentPage].currentState!;

          navigator.pop();
        },
        child: Scaffold(
            bottomNavigationBar: NavigationBar(
              selectedIndex: currentPage,
              onDestinationSelected: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              destinations: allDestinations
                  .map<NavigationDestination>((Destination destination) =>
                      NavigationDestination(
                          icon: Icon(destination.icon),
                          label: destination.name))
                  .toList(),
            ),
            appBar: AppBar(
              title: const Text("Gestor de gastos"),
              foregroundColor: theme.colorScheme.onPrimary,
              backgroundColor: theme.colorScheme.primary,
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.info_outline)),
                const SizedBox(
                  width: 12,
                )
              ],
            ),
            body: widget.child,
            floatingActionButton: widget
                .floatingActionButton // This trailing comma makes auto-formatting nicer for build methods.
            ));
  }
}
