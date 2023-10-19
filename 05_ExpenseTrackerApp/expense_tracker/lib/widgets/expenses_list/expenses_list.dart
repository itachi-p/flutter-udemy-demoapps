import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
  });

  // 表示したい経費データを受け取る為のリスト
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    /* 長さが不定の為、ColumnではなくListViewを使用する
    ListViewウィジェットのbuilderプロパティを使用すると、
    リストの下方の要素が実際に必要になるまで、リストの要素を作成しない
    これにより、パフォーマンスが向上する。
    また、ListView.builder()は、ListView()コンストラクタとは異なり、
    childrenプロパティではなく、itemBuilderプロパティを使用する。
    builderプロパティが取り得る様々な名前付き引数については公式ドキュメントを参照
    */
    return ListView.builder(
      // 作成する要素の数を指定
      itemCount: expenses.length,
      // itemBuilderプロパティには、ListViewの要素を作成する無名関数を指定
      // 2つの位置引数(必須)BuildContextとintはあらかじめ指定されている(名前は任意)
      // それぞれ、ListViewの要素のコンテキストと、作成する要素のインデックスを表す
      itemBuilder: (ctx, index) => Text(expenses[index].title),
    );
  }
}
