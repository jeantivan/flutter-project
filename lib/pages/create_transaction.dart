import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum TransactionType {
  income,
  expense,
}

class MontoView extends StatefulWidget {
  const MontoView({super.key});

  @override
  State<MontoView> createState() => _MontoViewState();
}

class _MontoViewState extends State<MontoView> {
  TransactionType transactionType = TransactionType.expense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const SizedBox(
          height: 88,
        ),
        SegmentedButton(
          segments: const [
            ButtonSegment(
                value: TransactionType.expense, label: Text("Gastos")),
            ButtonSegment(
                value: TransactionType.income, label: Text("Ingresos"))
          ],
          selected: <TransactionType>{transactionType},
          onSelectionChanged: (newSelection) {
            setState(() {
              transactionType = newSelection.first;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Text(
              "12123,12",
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 126,
              height: 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.colorScheme.primary),
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
                child: SizedBox(
              height: 60,
              child: FilledButton(
                  onPressed: () {},
                  child: Text("Siguiente",
                      style: theme.textTheme.titleLarge
                          ?.apply(color: theme.colorScheme.onPrimary))),
            )),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class CreateTransaction extends StatefulWidget {
  const CreateTransaction({super.key});

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Crear transacción"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(child: Text("Monto")),
              Tab(
                child: Text("Info"),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            MontoView(),
            Center(
              child: Text(
                "Paso 2",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ));
  }
}
