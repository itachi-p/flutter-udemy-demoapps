import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';

// 選択された料理単体の詳細を表示する画面(まずは簡易版として実装)
// TODO:後ほどStatefulWidgetに変更する
class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      // 選択された料理の画像を表示
      body: Image.network(
        meal.imageUrl,
        height: 300,
        width: double.infinity,
        // 適切に拡大・縮小され、画像が歪まないようにする
        fit: BoxFit.cover,
      ),
    );
  }
}