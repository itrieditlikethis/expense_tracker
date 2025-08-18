import 'package:expense_tracker/expenses.dart';
import 'package:expense_tracker/theming/theme.dart';
import 'package:expense_tracker/theming/util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "DM Sans", "Abel");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense tracker',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const Expenses(),
    );
  }
}
