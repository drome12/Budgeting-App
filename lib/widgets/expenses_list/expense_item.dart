//import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                    '\$${expense.amount.toStringAsFixed(2)}'), //toStringAsFixed(2) drops decimals after two
                const Spacer(), // widet takes up all the space it can between widgets in this ex text and row
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense
                        .formattedDate), // dont add parenthesis because is a getter
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
