import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  // デフォルトコンストラクタとは別に、名前付きの複数のコンストラクタを定義
  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  final Color color1;
  final Color color2;

  // ボタンを押されたら実行される関数を定義
  void rollDice() {
    // ...
  }

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/dice-5.png',
            width: 200,
          ),
          // 位置調整の方法1:画像とボタンの間に別のウィジェットを追加
          // SizedBoxは指定したサイズに固定。中身のコンテンツのサイズに合わせて伸縮しない
          const SizedBox(height: 20),
          TextButton(
            // ボタンを押されたら実行される関数を指定(実行ではなく、参照先の関数名を指定)
            onPressed: rollDice,
            style: TextButton.styleFrom(
              // 位置調整の方法2:paddingを追加
              // padding: const EdgeInsets.only(
              //   top: 20,
              // ),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              ),
            ),
            child: const Text('Roll Dice'),
          ),
        ],
      )),
    );
  }
}
