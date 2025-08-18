import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      // surfaceTintColor: ColorScheme.of(context).primary,
      margin: EdgeInsets.only(bottom: 10, left: 0, right: 0, top: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          spacing: 16,
          children: [
            Text(expense.title),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  spacing: 20,
                  children: [
                    Icon(categoryIcons[expense.category]),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
