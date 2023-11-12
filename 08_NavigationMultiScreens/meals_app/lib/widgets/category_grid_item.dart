import 'package:flutter/material.dart';

import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(
        category.title,
        // スタイルはテーマから取得するが、copyWithで一部変更する為にnull許容型にする
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              // mainで設定したベースカラーを基に、背景色に合わせた文字色を自動で設定
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}
