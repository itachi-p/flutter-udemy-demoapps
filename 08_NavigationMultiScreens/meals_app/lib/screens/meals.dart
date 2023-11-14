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
      body: 
      // DUMMY: 仮のウィジェット
      const Center(
        child: Text('The meals for the category!'),
      ),
    );
  }
}
