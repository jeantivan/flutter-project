import 'dart:math';
import 'package:flutter/material.dart';

import 'package:proyecto_flutter/common/category.dart';
import 'package:proyecto_flutter/common/transaction.dart';
import 'package:proyecto_flutter/widget/transaction_list_item.dart';

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
                            final now = DateTime.now();
                            final trans = Transaction(
                                id: "$index",
                                title: "Transaccion $index",
                                description: "Description",
                                date: now.subtract(Duration(hours: 3 * index)),
                                amount: Random().nextBool()
                                    ? Random().nextDouble() * 700
                                    : Random().nextDouble() * -700,
                                category: Category.coffee);
                            return TransactionItemList(transaction: trans);
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
