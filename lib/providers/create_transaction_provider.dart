import 'package:flutter/material.dart';
import 'package:proyecto_flutter/common/transaction.dart';

class CreateTransactionProvider with ChangeNotifier {
  TransactionType _transactionType = TransactionType.expense;
  String _amount = "";

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
}
