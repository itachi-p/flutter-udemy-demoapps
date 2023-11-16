import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  // 前の画面で選択されたカテゴリーを受け取る
  final String title;
  final List<Meal> meals;

  // カテゴリー分類された料理リストを表示する画面
  @override
  Widget build(BuildContext context) {
    // スクロール可能、かつ動的に可視部分だけのウィジェット生成でパフォーマンス最適化
    Widget content = ListView.builder(
      // itemCountプロパティに、リストの要素数を渡す
      // これがないと、ListViewを正しくレンダリングできない
      itemCount: meals.length,
      // itemBuilderプロパティには、contextとindexを引数にとり、ウィジェットを返す関数を渡す
      itemBuilder: (cxt, index) => MealItem(meal: meals[index]),
    );

    // mealsの中身が空の場合に備え、場合分けする
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // テーマカラーを基に、背景色に合わせた文字色を自動で設定
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
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

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
