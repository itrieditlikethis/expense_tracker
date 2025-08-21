import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Expense> expenses;

  const Chart({super.key, required this.expenses});

  List<ExpenseBucket> get buckets {
    final List<ExpenseBucket> categoryList = List.generate(
      Category.values.length,
      (index) => ExpenseBucket.forCategory(
        allExpenses: expenses,
        category: Category.values[index],
      ),
    );

    return categoryList;
  }

  double get maxTotalCategory {
    double maxTotalCategory = 0;

    for (final bucket in buckets) {
      final double bucketTotal = bucket.totalExpenses;
      if (bucketTotal > maxTotalCategory) maxTotalCategory = bucketTotal;
    }

    return maxTotalCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: buckets.map((bucket) {
                final barFill = bucket.totalExpenses == 0.0
                    ? 0.0
                    : bucket.totalExpenses / maxTotalCategory;
                return ChartBar(fill: barFill);
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(categoryIcons[bucket.category]),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
