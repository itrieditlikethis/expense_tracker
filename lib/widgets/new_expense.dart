import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _addNewExpenseController = TextEditingController();

  @override
  void dispose() {
    _addNewExpenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(30),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _addNewExpenseController,
              maxLength: 50,
              decoration: InputDecoration(label: Text("what expense?")),
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
