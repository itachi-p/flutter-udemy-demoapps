import 'package:flutter/material.dart';

import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // デフォルトコンストラクタとは別に定義した名前付きコンストラクタを呼び出す
        body: GradientContainer.purple(),
      ),
    ),
  );
}
