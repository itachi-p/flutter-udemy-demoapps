import 'package:flutter/material.dart';

import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    // Navigator.popとは逆に、画面スタックの一番上に新しい画面を押し込む
    Navigator.of(context).push(
      // Navigator.push(content, route)でも同じ
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: 'Some title',
          meals: [],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Flutterでは一般的に、マルチスクリーンの場合はベースにScaffoldを使う
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category!'),
      ),
      // ListViewと同じく、builderを使って動的に可視部分だけのウィジェット生成も可能
      // ここではそこまで長いGridにならずメモリ最適化の必要性は薄いので不要
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 横方向(縦のGridに対するクロス軸)のウィジェット数
          childAspectRatio: 3 / 2, // ウィジェットの縦横比を動的に変更
          crossAxisSpacing: 20, // 各アイテム間の横方向のスペース
          mainAxisSpacing: 20, // 同　縦方向のスペース
        ),
        children: [
          // dummy_data.dartで定義したカテゴリーリストを使って動的に生成
          // mapメソッドを使った場合と同じ挙動だが、ここではfor...in文を使う
          // availableCategories.map((ctgry) => CategoryGridItem(category: ctgry)).toList(),

          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(context),
            ),
        ],
      ),
    );
  }
}
