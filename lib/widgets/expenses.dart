import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regesterExpenses = [
    Expense(title: 'Flutter course', amount: 29.99, date: DateTime.now(), category: Category.work),
    Expense(title: 'Cinema', amount: 15.99, date: DateTime.now(), category: Category.leisure)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Title'),
          Expanded(
            child: ExpensesList(expensesList: _regesterExpenses),
          ),
        ],
      ),
    );
  }
}
