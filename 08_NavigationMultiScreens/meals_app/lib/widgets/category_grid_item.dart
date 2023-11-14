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
    // Container以下をタップ可能にする為にInkWellでラップ
    // GestureDetectorでも様々なリスナーを設定できるが、InkWellは視覚的なフィードバックが付く
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor, // タップ時の色効果
      borderRadius: BorderRadius.circular(16), // 角を丸くする
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // 角を丸くする
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
      ),
    );
  }
}
