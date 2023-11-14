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
    // mealsの中身が空の場合に備え、場合分けする
    Widget content = ListView.builder(
      itemBuilder: (cxt, index) => Text(
        meals[index].title,
      ),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // テーマカラーを基に、背景色に合わせた文字色を自動で設定
            Text('Uh oh ... nothing here!', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    // カテゴリー分類された料理リストを表示する
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // スクロール可能、かつ動的に可視部分だけのウィジェット生成でパフォーマンス最適化
      // itemBuilderプロパティには、contextとindexを引数にとり、ウィジェットを返す関数を渡す
      body: content,
    );
  }
}
