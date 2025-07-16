import 'package:ds/ds.dart';
import 'package:finance_app/src/enums/category_enum.dart';
import 'package:flutter/material.dart';

import '../../../models/transaction.dart';

class TransactionsCardWidget extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsCardWidget({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);
    if (transactions.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: colors.neutral30,
            width: 1,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: AppText.textSm(
            'Nenhum lançamento encontrado',
            customTextStyle: TextStyle(color: colors.neutral50),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: colors.neutral30,
          width: 1,
        ),
      ),
      // height: 200,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.title2xs(
                  'LANÇAMENTOS'.toUpperCase(),
                  customTextStyle: TextStyle(color: colors.neutral50),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colors.neutral20,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: AppText.title2xs(transactions.length.toString()),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: colors.neutral20,
          ),
          ...transactions.map((transaction) {
            final isExpense = transaction.amount < 0;
            final day = transaction.date.day.toString().padLeft(2, '0');
            final month = transaction.date.month.toString().padLeft(2, '0');
            final year = transaction.date.year;
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  title: AppText.titleSm(transaction.title),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: colors.neutral20,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      _getCategoryIcon(transaction.category),
                      color: isExpense ? colors.error : colors.success,
                    ),
                  ),
                  subtitle: AppText.textSm('$day/$month/$year'),
                  trailing: AppText.titleSm(
                    '${isExpense ? '-' : '+'} R\$ ${transaction.amount.abs().toStringAsFixed(2)}',
                    customTextStyle: TextStyle(
                      color: isExpense ? colors.error : colors.success,
                    ),
                  ),
                ),
                if (transaction != transactions.last)
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: colors.neutral20,
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(CategoryEnum? category) {
    switch (category) {
      case CategoryEnum.food:
        return Icons.fastfood;
      case CategoryEnum.transport:
        return Icons.directions_car;
      case CategoryEnum.entertainment:
        return Icons.movie;
      case CategoryEnum.shopping:
        return Icons.shopping_cart;
      case CategoryEnum.health:
        return Icons.health_and_safety;
      case CategoryEnum.utilities:
        return Icons.lightbulb;
      case CategoryEnum.education:
        return Icons.school;
      case CategoryEnum.salary:
        return Icons.account_balance_wallet;
      default:
        return Icons.category;
    }
  }
}
