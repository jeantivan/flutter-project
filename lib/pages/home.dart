import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final List<Widget> items = List.generate(
    12,
    (w) => Container(
          width: 200,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12)),
        ));

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: theme.colorScheme.primary,
              child: Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12, left: 12, right: 12),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        visualDensity: VisualDensity.compact,
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(
                          'Ultimas transacciones: ',
                          style: theme.textTheme.headlineSmall,
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.work_history_rounded),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 200,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: theme.colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(12)),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
