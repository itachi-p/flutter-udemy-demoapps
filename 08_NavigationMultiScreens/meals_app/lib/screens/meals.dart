import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  // 前の画面で選択されたカテゴリーを受け取る
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    // カテゴリー分類された料理リストを表示する
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // スクロール可能、かつ動的に可視部分だけのウィジェット生成でパフォーマンス最適化
      // itemBuilderプロパティには、contextとindexを引数にとり、ウィジェットを返す関数を渡す
      body: ListView.builder(
        itemBuilder: (cxt, index) => Text(
          meals[index].title,
        ),
      ),
    );
  }
}
