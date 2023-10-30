import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

// カラースキームを設定するグローバル変数
// kで始まる変数名は、Flutterでグローバル変数を設定する際の慣習
// ColorScheme.fromSeed()の引数に渡したseedColorを基準にした色の組み合わせを生成
final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

// ダークモード用に追加のカラースキームを設定
final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      // Dark Modeを追加
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        // 別個上書き設定しているcardTheme.margin!.horizontalが
        // ダークモードではnullになりエラーが発生してしまうのでここで設定
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
         elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      // ThemeData()そのものには引数を渡さずcopyWith()で引数を渡すと、
      // 既存のデフォルト設定に引数で渡した値の差分だけをオーバーライドする形でテーマを設定できる
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        // elevatedButtonにはcopyWith()がないので、styleFrom()で設定
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      // ダークモードをシステム設定に合わせる(デフォルトなので省略可)
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
