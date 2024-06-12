import 'package:flutter/material.dart';
import 'package:proyecto_flutter/common/transaction.dart';
import 'package:proyecto_flutter/common/category.dart';

class CreateTransactionProvider with ChangeNotifier {
  TransactionType _transactionType = TransactionType.expense;
  String _amount = "";
  Category? _category = Category.health;
  DateTime _date = DateTime.now();

  String get amount => _amount;

  void changeAmount(val) {
    _amount = val;
    notifyListeners();
  }

  TransactionType get transactionType => _transactionType;

  void changeTransactionType(TransactionType type) {
    _transactionType = type;
    notifyListeners();
  }

  Category? get category => _category;

  void selectCategory(Category category) {
    _category = category;
    notifyListeners();
  }

  DateTime get date => _date;

  void changeTransactionDate(DateTime date) {
    _date = date;
    notifyListeners();
  }
}
