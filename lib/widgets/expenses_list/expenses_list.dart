import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expensesList,
    required this.removeExpense,
  });

  final List<Expense> expensesList;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (BuildContext context, int index) => Dismissible(
        key: ValueKey(expensesList[index]),
        onDismissed: (direction) {
          removeExpense(expensesList[index]);
        },
        child: ExpenseItem(expensesList[index]),
      ),
    );
  }
}
