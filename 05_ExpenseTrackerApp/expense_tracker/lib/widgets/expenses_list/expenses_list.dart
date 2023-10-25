import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    // 長さが不定の為、ColumnではなくListViewを使用する
    // builderプロパティはリストの下方の要素が実際に必要になるまで作成しない
    return ListView.builder(
      // 作成する要素の数を指定
      itemCount: expenses.length,
      // アイテムをスワイプ(削除)可能にするウィジェットでラップする
      itemBuilder: (ctx, index) => Dismissible(
        // スワイプによって削除される要素の一意なキーを指定
        key: ValueKey(expenses[index]),
        // 見た目上のスワイプだけでなく、実際に削除処理を指定
        onDismissed: (direction) => {
          // 引数として受け取るdirectionはスワイプの方向を示すが、今回は不要
          // 使う予定のない引数なので、(_)として無視してもよい
          onRemoveExpense(expenses[index]),
        },
        child: ExpensesItem(
          expenses[index],
        ),
      ),
    );
  }
}
