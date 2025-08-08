import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _addNewExpenseController = TextEditingController();
  final _addAmountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.transport;

  void _onSelectDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      initialDate: now,
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _onSelectCategory(Category category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _submitNewExpenseData() {
    final enteredAmount = double.tryParse(_addAmountController.text);
    final isInvalidAmount = enteredAmount == null || enteredAmount <= 0;
    if (_addNewExpenseController.text.trim().isEmpty ||
        isInvalidAmount ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text("Please fill all fields to save"),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Ok')),
          ],
        ),
      );
      return;
    }
  }

  @override
  void dispose() {
    _addNewExpenseController.dispose();
    _addAmountController.dispose();
    _selectedDate = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(30),
      child: Column(
        spacing: 30,
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
          Row(
            spacing: 30,
            children: [
              Expanded(
                child: TextField(
                  controller: _addAmountController,
                  maxLength: 6,
                  decoration: InputDecoration(
                    label: Text('amount'),
                    prefixText: '\$ ',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate != null
                          ? formatter.format(_selectedDate ?? DateTime.now())
                          : "enter date",
                    ),
                    IconButton(
                      onPressed: _onSelectDate,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  // if (value == null) return;
                  _onSelectCategory(value ?? Category.food);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _submitNewExpenseData,
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
