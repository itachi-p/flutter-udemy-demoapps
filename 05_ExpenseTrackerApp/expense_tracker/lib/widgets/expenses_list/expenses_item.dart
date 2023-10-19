import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

// リスト内の個々の要素を表示するウィジェット
class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    // 今回はCardウィジェットを使用してみる
    // 主に個々の要素の外観スタイリングを目立たせる為に使用する
    return Card(
      // Cardにはpaddingプロパティがないので、TextをPaddingで包む
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                // double型を小数点以下2桁に固定した文字列に変換、かつ前に$記号を付ける
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                // 残りのカテゴリーと日付は一緒にグループ化して右端に表示したい
                // Spacerウィジェットを使用すると、残りのスペースを全て埋める
                const Spacer(),
                Row(
                  children: [
                    // とりあえずダミーで内蔵アイコンを表示してみる
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    // DateTime型のフォーマットを整形した文字列を表示
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
