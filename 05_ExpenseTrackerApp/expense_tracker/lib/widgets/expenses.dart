import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // ダミーの経費データを作成
  // ※後で経費を入力できるように作り変える
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 画面最上部にAppBarを追加、右端にメニューアイコンのみを表示
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      // Columnの中にListViewのような可変長のウィジェットを配置する場合、
      // 内側のウィジェットのサイズ制御方法がわからない為にエラーが発生する。
      // この場合、間にExpandedウィジェットを配置することでエラーを回避できる。
      body: Column(
        children: [
          // TODO: Add Chart Widget
          const Text('The Chart'),
          //実際に経費データを表示するListウィジェット
          // リスト形式(Column)の中にリスト形式(ListView)なので
          // エラーの為、間にExpandedウィジェットを配置する。
          Expanded(
            child: ExpenseList(expenses: _registeredExpense),
          ),
        ],
      ),
    );
  }
}
