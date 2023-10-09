import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  // 呼び出し元から渡されるテキストをインスタンス変数(プロパティ)で受け取る
  const StyledText(this.text, {super.key});
  // finalを付けないと内部で値が変更される可能性がある為、コンストラクタがconstにできない
  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      // テキストのスタイル設定部分はまだ固定であるため、ここにはconstが付けられる
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28.0,
      ),
    );
  }
}
