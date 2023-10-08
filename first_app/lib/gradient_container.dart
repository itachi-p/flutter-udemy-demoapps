import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {

  // カスタムウィジェットのコンストラクタで名前付き引数keyを親クラスのコンストラクタに渡す
  // const GradientContainer({Key? key}) : super(key: key);

  // 上記は頻繁に書くことになり、冗長なので下記のように略記できる
  const GradientContainer({super.key});

  @override // アノテーションは省略も可能だが、オーバーライドしていることが明確にできる
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 87, 9, 223),
            Color.fromARGB(255, 201, 5, 229)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}
