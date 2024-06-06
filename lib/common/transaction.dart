import 'package:proyecto_flutter/common/category.dart';

class Transaction {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final double amount;
  final Category category;

  const Transaction(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.amount,
      required this.category});
}
