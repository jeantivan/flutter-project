import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_flutter/common/transaction.dart';

class CreateTransactionProvider with ChangeNotifier {
  TransactionType _transactionType = TransactionType.expense;
  String _amount = "";
  Category? _category;

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
}
