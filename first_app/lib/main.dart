import 'package:flutter/material.dart';

// 外部ファイルに切り出したカスタムウィジェットをインポート
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: GradientContainer(),
      ),
    ),
  );
}
