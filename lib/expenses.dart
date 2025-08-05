import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'gas',
      amount: 43.85,
      date: DateTime.now(),
      category: Category.transport,
    ),
    Expense(
      title: 'breakfast',
      amount: 24.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "cinema",
      amount: 32.50,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense tracker"),
        actions: [
          TextButton(onPressed: _openAddExpenseOverlay, child: Text("add")),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('charts'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
