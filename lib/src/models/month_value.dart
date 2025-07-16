import 'package:finance_app/src/models/transaction.dart';

class MonthValue {
  String month;
  DateTime period;
  double availableValue;
  double usedValue;
  double limitValue;
  List<Transaction> transactions;

  MonthValue({
    required this.month,
    required this.period,
    required this.availableValue,
    required this.usedValue,
    required this.limitValue,
    this.transactions = const [],
  });
}
