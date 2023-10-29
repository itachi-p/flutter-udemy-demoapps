import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      // アプリ全体に影響を与える共通構成をここで設定
      // テーマ設定(色、テキストスタイルなどの組み合わせ)もその一つ
      // ThemeData()そのものには引数を渡さずcopyWith()で引数を渡すと、
      // 既存のデフォルト設定に引数で渡した値の差分だけをオーバーライドする形でテーマを設定できる
      theme: ThemeData().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 237, 145, 244)),
      home: const Expenses(),
    ),
  );
}
