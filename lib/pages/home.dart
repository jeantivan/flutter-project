import 'package:flutter/material.dart';
import 'package:proyecto_flutter/widget/layout.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minWidth = MediaQuery.of(context).size.width;
    return Layout(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      child: Container(
        color: theme.colorScheme.primary,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: theme.colorScheme.primary,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 12, left: 12, right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tu saldo: ",
                              style: theme.textTheme.titleLarge
                                  ?.apply(color: theme.colorScheme.onPrimary)),
                          Text("542.13 €",
                              style: theme.textTheme.displayMedium
                                  ?.apply(color: theme.colorScheme.onPrimary)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: minWidth,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.elliptical(32, 24),
                            topRight: Radius.elliptical(32, 32))),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Ultimas transacciones: ',
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}