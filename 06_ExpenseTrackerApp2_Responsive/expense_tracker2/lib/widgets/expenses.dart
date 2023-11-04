import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

// Section5のExpenseTrackerをresponsive対応させていく

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      // Flutterはデバイス上部にあるカメラやステータスバーの位置を把握している
      // 上部のPadding余白を大きめに設定するのでなく、用意されている仕組みに任せる
      useSafeArea: true, // この設定によって、カメラやステータスバーを回避する
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ここでユーザーの使用環境を取得し、それに応じて表示を変える
    // MediaQuery.of(context)オブジェクトにアクセスし様々なメタ情報を取得できる
    final screenWidth = MediaQuery.of(context).size.width; // 画面の幅

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      // 画面幅に応じて表示を変える
      // HACK(WARNING):三項式の記述が長くなると可読性が下がる
      body: screenWidth < 600
          ? Column(children: [
              Chart(expenses: _registeredExpenses),
              Expanded(
                child: mainContent,
              ),
            ])
          : Row(children: [
              // ColumnからRowに変更する上で、width: double.infinityが問題になる
              // 最大幅を取ろうとする子要素が横に並ぶUIは表示できない為、Expandedで包む
              Expanded(
                child: Chart(expenses: _registeredExpenses),
              ),
              Expanded(
                child: mainContent,
              ),
            ]),
    );
  }
}
