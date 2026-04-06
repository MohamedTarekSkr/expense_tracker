import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regesterExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 29.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(onAddExpense: _addExpense);
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _regesterExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _regesterExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('there is no content here'));
    if (_regesterExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expensesList: _regesterExpenses,
        removeExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ExpenceTraker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Title'),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
