import 'package:proyecto_flutter/common/category.dart';

enum TransactionType {
  income,
  expense,
}

class Transaction {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final double amount;
  final Category category;
  final TransactionType type;

  const Transaction(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.amount,
      required this.category,
      required this.type});
}
