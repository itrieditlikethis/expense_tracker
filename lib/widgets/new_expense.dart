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
  final _addAmmountController = TextEditingController();

  // final _expenseDataMap = {};

  @override
  void dispose() {
    _addNewExpenseController.dispose();
    _addAmmountController.dispose();
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
            TextField(
              controller: _addAmmountController,
              maxLength: 6,
              decoration: InputDecoration(
                label: Text('amount'),
                prefixText: '\$ ',
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => print(
                    '${_addNewExpenseController.text} / ${_addAmmountController.text}',
                  ),
                  child: Text('Save'),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Cancel")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
