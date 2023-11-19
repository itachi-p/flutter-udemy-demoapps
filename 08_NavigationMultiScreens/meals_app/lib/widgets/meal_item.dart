import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';

// カテゴリー別料理リストの中の料理1件を表示するウィジェット
class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;
  // 特定の料理がタップされた時の処理を実装
  final void Function(Meal meal) onSelectMeal;
  // Navigatorを使って画面遷移したい都合の為に、関数定義の引数にcontextを付け加えても良い
  // しかし以下のように、呼び出し側で使えるcontextを渡しても機能は実現する。なので今回は含めない
  // onTap: () => selectMeal(context, meal)
  // final void Function(BuildContext context, Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    // 食事リスト中から特定の料理をタップして詳細画面に遷移できるようにする
    return Card(
      margin: const EdgeInsets.all(8),
      // Cardの角を指定の条件で丸くする
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // しかし、StackはデフォルトでCardのshape設定を無視するので、
      // 更にclipBehaviorプロパティを指定する必要がある
      clipBehavior: Clip.hardEdge, // これを指定しないと角が丸くならない
      elevation: 2, // Cardの背後に影を付け、高低差と立体効果を出す

      child: InkWell(
        // 引数を渡す必要が無い場合のみ、onTap: selectMeal と記述できる
        onTap: () => onSelectMeal(meal),
        // Stackは子ウィジェットを下から順に重ねて表示する(画像の上にテキスト等)
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover, // 画像が歪まないように拡大縮小する
              height: 200,
              width: double.infinity, // 画面幅いっぱいに広げる
            ),
            // 上の画像に重なる形で、どの範囲で配置するかを指定
            Positioned(
              // 上の画像の下端、かつ幅は左右いっぱいに配置
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2, // タイトルが長い時のために2行まで表示
                      textAlign: TextAlign.center,
                      softWrap: true, // テキストに折り返しが必要な場合に、見栄え良く改行する
                      overflow: TextOverflow.ellipsis, // テキストが非常に長い場合、...で省略
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // メタデータ群を表示
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
