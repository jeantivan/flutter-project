import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/providers/create_transaction_provider.dart';

String formatDate(DateTime date) {
  final month = date.month < 10 ? "0${date.month}" : date.month;
  final year = date.year;
  final day = date.day < 10 ? "0${date.day}" : date.day;

  return "$year/$month/$day";
}

class InputDatepicker extends StatelessWidget {
  const InputDatepicker({super.key});

  @override
  Widget build(BuildContext context) {
    final date = context.watch<CreateTransactionProvider>().date;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Flexible(
                  child: Text(
                "Fecha",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              )),
              Text(formatDate(date),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.black87)),
              IconButton(
                  onPressed: () => _openDatePicker(context, date),
                  icon: const Icon(Icons.calendar_month_outlined))
            ],
          )),
    );
  }

  void _openDatePicker(BuildContext context, DateTime date) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2100, 1),
        initialDate: date);

    if (context.mounted && newDate != null) {
      context.read<CreateTransactionProvider>().changeTransactionDate(newDate);
    }
  }
}
