import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

// カテゴリー別料理リストの中の料理1件を表示するウィジェット
class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    // 食事リスト中から特定の料理をタップして詳細画面に遷移できるようにする
    return Card(
      child: InkWell(
        onTap: () {},
        // Stackは子ウィジェットを下から順に重ねて表示する(画像の上にテキスト等)
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            // 上の画像に重なる形で、どの範囲で配置するかを指定
            Positioned(
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
                    Row(
                      children: [
                        
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
