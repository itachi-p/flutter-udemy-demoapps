import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  // const GradientContainer({Key? key}) : super(key: key);
  // 上記は頻繁に書くことになり、冗長なので下記のように略記できる
  const GradientContainer({super.key});

  @override // アノテーションは省略も可能だが、オーバーライドしていることが明確にできる
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color.fromARGB(255, 87, 9, 223),
            Color.fromARGB(255, 201, 5, 229)
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyledText()
      ),
    );
  }
}
