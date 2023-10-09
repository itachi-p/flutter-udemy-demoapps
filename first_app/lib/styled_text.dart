import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  // 呼び出し元から渡されるテキストをインスタンス変数(プロパティ)で受け取る
  // const StyledText(String text, {super.key}): outputText = text;
  // final String outputText;

  // 上記を以下のように簡略に書き換えることもできる（冗長なので通常は下記のように書く）
  // 変数名は何でもいいが、上記のように区別の為にtextとoutputTextに分ける必要はなくなった
  const StyledText(this.text, {super.key});
  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28.0,
      ),
    );
  }
}
