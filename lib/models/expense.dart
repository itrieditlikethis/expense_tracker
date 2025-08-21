import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat('dd-MM-yyy');

const categoryIcons = {
  Category.food: Icons.restaurant,
  Category.transport: Icons.local_taxi,
  Category.entertainment: Icons.beach_access,
  Category.taxes: Icons.payment,
};

enum Category { food, transport, entertainment, taxes }

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.expenses, required this.category});

  ExpenseBucket.forCategory({
    required List<Expense> allExpenses,
    required this.category,
  }) : expenses = allExpenses
           .where((expense) => expense.category == category)
           .toList();

  final List<Expense> expenses;
  final Category category;

  double get totalExpenses {
    double sum = expenses.fold(
      0,
      (prevExpenseAmmount, expense) => prevExpenseAmmount + expense.amount,
    );
    return sum;
  }
}
