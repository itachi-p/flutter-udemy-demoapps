import 'package:flutter/material.dart';

// 外部ファイルに切り出したカスタムウィジェットをインポート
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // body: GradientContainer(colors...),
        //リスト型から2つの位置引数に変更した為、呼び出し元も変更
        body: GradientContainer(
          Color.fromARGB(255, 65, 11, 159),
          Color.fromARGB(255, 127, 36, 176),
        ),
      ),
    ),
  );
}
