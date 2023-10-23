import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // ダミーの経費データを作成
  final List<Expense> _registeredExpense = [
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

  // 経費を追加する為のモーダルシートを表示する関数
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      // モーダルオーバーレイの高さを利用可能な全てのスペースを使用するように設定
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  // 上記のモーダルシートで入力された新しい経費データを追加する関数
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 画面最上部にAppBarを追加、右端にメニューアイコンのみを表示
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          // TODO: Add Chart Widget
          const Text('The Chart'),
          //実際に経費データを表示するListウィジェット
          // Columnの中でListViewのような可変長ウィジェットはExpandedで包む
          Expanded(
            child: ExpenseList(expenses: _registeredExpense),
          ),
        ],
      ),
    );
  }
}
