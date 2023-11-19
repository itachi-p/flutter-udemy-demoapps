import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:meals_app/screens/meal_details.dart';

// 選択された特定のカテゴリーに属する料理リストを表示する画面
class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  // 前の画面で選択されたカテゴリーを受け取る
  final String title;
  final List<Meal> meals;

  // 特定の料理がタップされた時の処理を実装
  // Navigatorを使って、詳細画面に遷移する為に引数にcontextを追加
  void selectMeal(BuildContext context, Meal meal) {
    // 画面スタックの一番上に新しい画面を押し込む（その為にcontextが必要になる）
    Navigator.of(context).push(
      // pushにMealDetailsScreenを直接渡すのではなく、MaterialPageRouteで包む
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 場合分け:mealsの中身の有無で、表示するウィジェットを変える
    Widget content;

    // mealsリストが空でなければ、ListViewを生成する
    if (meals.isNotEmpty) {
      // スクロール可能かつ動的に可視部分だけのウィジェット生成によりパフォーマンス最適化
      content = ListView.builder(
        // itemCountプロパティにリストの要素数を渡さないと、正しくレンダリングできない
        itemCount: meals.length,
        // itemBuilderプロパティには、BuildContextとindexを引数にとりWidgetを返す関数を渡す
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          // onSelectMealプロパティに直接selectMeal関数を渡すのでなく、
          // 匿名関数を間に挟むことで、引数にcontextも渡せるようにする
          // こうすれば、MealItem内のonSelectMeal関数の引数にまでcontextを渡す必要がなくなる
          onSelectMeal: (meal) => selectMeal(context, meal),
        ),
      );
    } else {
      // もしmealsリストが空の場合は、何もない旨を表示する
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
