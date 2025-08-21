import 'package:expense_tracker/expenses.dart';
import 'package:expense_tracker/theming/theme.dart';
import 'package:expense_tracker/theming/util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // void _changeColorScheme(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => SimpleDialog(
  //       title: const Text('Change theme'),
  //       children: [
  //         Column(
  //           children: [
  //             TextButton(onPressed: () {}, child: Text('Light')),
  //             TextButton(onPressed: () {}, child: Text('Light medium')),
  //             TextButton(onPressed: () {}, child: Text('Light contrast')),
  //             TextButton(onPressed: () {}, child: Text('Dark')),
  //             TextButton(onPressed: () {}, child: Text('Dark medium')),
  //             TextButton(onPressed: () {}, child: Text('Dark contrast')),
  //           ],
  //         ),
  //         TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Apply')),
  //       ],
  //     ),
  //   );
  //   return;
  // }

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "DM Sans", "Abel");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense tracker',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      // home: Expenses(onChangeColorScheme: _changeColorScheme),
      home: Expenses(),
    );
  }
}
