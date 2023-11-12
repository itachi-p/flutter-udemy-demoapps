import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 横方向(縦のGridに対するクロス軸)のウィジェット数
          childAspectRatio: 3 / 2, // ウィジェットの縦横比を動的に変更
          crossAxisSpacing: 20, // 各アイテム間の横方向のスペース
          mainAxisSpacing: 20, // 同　縦方向のスペース
        ),
        children: const [
          // DUMMY: 仮のデータ
          Text('1', style: TextStyle(color: Colors.white)),
          Text('2', style: TextStyle(color: Colors.white)),
          Text('3', style: TextStyle(color: Colors.white)),
          Text('4', style: TextStyle(color: Colors.white)),
          Text('5', style: TextStyle(color: Colors.white)),
          Text('6', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
