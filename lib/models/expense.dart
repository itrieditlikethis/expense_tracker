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
