import 'package:finance_app/src/enums/category_enum.dart';

class Transaction {
  // final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryEnum? category;

  Transaction({
    // required this.id,
    required this.title,
    required this.amount,
    required this.date,
    this.category,
  });
}
