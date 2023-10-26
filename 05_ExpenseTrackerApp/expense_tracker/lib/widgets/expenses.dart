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

  // スワイプされた経費を、見た目上の処理だけでなく実際に削除する関数
  void _removeExpense(Expense expense) {
    // 削除実行前に、削除される経費のインデックスを取得
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    // 削除された経費を元に戻すこともできるよう、SnackBarを表示
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              // 削除前と同じに戻したいのでaddではなくinsertを使用
              _registeredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 経費データが1件も無い場合の条件分岐を追加
    // コンテンツ全体をウィジェットを格納する変数とし、初期値を設定
    // ↑…といった類のコメントこそが「コードを読めばわかる不要なコメント」の典型例なのかもしれない
    // 自分の独習用なので記憶の定着の為にと書いているが、改めて"The Art of Readable Code"を読み認識を改める
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpense,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
