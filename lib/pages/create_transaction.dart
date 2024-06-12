import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/common/transaction.dart';
import 'package:proyecto_flutter/common/category.dart';
import 'package:proyecto_flutter/providers/create_transaction_provider.dart';
import 'package:proyecto_flutter/widget/category_choice.dart';
import 'package:proyecto_flutter/widget/input_datepicker.dart';
import 'package:proyecto_flutter/widget/numeric_textfield.dart';

class MontoView extends StatelessWidget {
  final VoidCallback nextStep;
  const MontoView({super.key, required this.nextStep});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final amount = context.watch<CreateTransactionProvider>().amount;
    final transactionType =
        context.watch<CreateTransactionProvider>().transactionType;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 250,
            child: SegmentedButton(
              segments: const [
                ButtonSegment(
                    value: TransactionType.expense, label: Text("Gastos")),
                ButtonSegment(
                    value: TransactionType.income, label: Text("Ingresos"))
              ],
              selected: <TransactionType>{transactionType},
              onSelectionChanged: (newSelection) => context
                  .read<CreateTransactionProvider>()
                  .changeTransactionType(newSelection.first),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              NumericTextfield(
                labelText: "Monto",
                onChanged: (value) => context
                    .read<CreateTransactionProvider>()
                    .changeAmount(value),
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
          const SizedBox(
            height: 20,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                height: 48,
                child: FilledButton(
                    onPressed: amount != "" ? nextStep : null,
                    child: Text("Siguiente",
                        style: theme.textTheme.titleMedium
                            ?.apply(color: theme.colorScheme.onPrimary))),
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final amount = context.watch<CreateTransactionProvider>().amount;
    final transactionType =
        context.watch<CreateTransactionProvider>().transactionType;
    final date = context.watch<CreateTransactionProvider>().date;
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  buildTransactionChip(context, transactionType),
                  Text(
                    "$amount €",
                    style: theme.textTheme.displaySmall,
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              Text("Categoría", style: theme.textTheme.titleMedium),
              Wrap(
                  spacing: 8,
                  children: Category.values
                      .map((category) => CategoryChoice(category: category))
                      .toList()),
              const SizedBox(
                height: 12,
              ),
              Text("Fecha", style: theme.textTheme.titleMedium),
              Row(
                children: [
                  Expanded(
                    child: CalendarDatePicker(
                        initialDate: date,
                        firstDate: DateTime(2000, 1),
                        lastDate: DateTime(2100, 1),
                        onDateChanged: (newDate) {
                          if (context.mounted) {
                            context
                                .read<CreateTransactionProvider>()
                                .changeTransactionDate(newDate);
                          }
                        }),
                  ),
                ],
              ),
              //const InputDatepicker(),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 48,
                    child: FilledButton(
                        onPressed: () {},
                        child: Text("Siguiente",
                            style: theme.textTheme.titleMedium
                                ?.apply(color: theme.colorScheme.onPrimary))),
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }

  Widget buildTransactionChip(
      BuildContext context, TransactionType transactionType) {
    final colorScheme = Theme.of(context).colorScheme;
    final isExpense = transactionType.name == "expense";

    final backgroundColor =
        isExpense ? colorScheme.errorContainer : colorScheme.primaryContainer;

    final borderSide = BorderSide(
        color: isExpense
            ? colorScheme.onErrorContainer
            : colorScheme.onPrimaryContainer);

    final labelStyle = TextStyle(
        color: isExpense
            ? colorScheme.onErrorContainer
            : colorScheme.onPrimaryContainer);

    return Chip(
        side: borderSide,
        labelStyle: labelStyle,
        backgroundColor: backgroundColor,
        visualDensity: VisualDensity.compact,
        labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        label: Text(isExpense ? "Gasto" : "Ingreso"));
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
            tabs: const [
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
            MontoView(nextStep: () {
              setState(() {
                _tabController.animateTo(1);
              });
            }),
            const InfoView()
          ],
        ));
  }
}
