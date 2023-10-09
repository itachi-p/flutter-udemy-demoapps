import 'package:flutter/material.dart';
import 'dart:math';

// 変化する状態を管理するクラス(ステートフルウィジェット)
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// ステートフルウィジェットの状態を管理する秘匿クラス(2つセットで定義)
// 慣行的にステートクラスの命名は「_{ステートフルウィジェット名}State」
// _DiceRollerStateクラスはDiceRollerクラスの中でしか参照できない
class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-2.png';

  // ボタンを押されたら実行される関数を定義
  void rollDice() {
    // ランダムな整数を生成
    var diceRoll = Random().nextInt(6) + 1; // 1<>6の範囲でランダムな整数を生成
    // setState()を呼び出すことで、変化する状態を管理するクラスのbuild()が再実行される
    setState(() {
      activeDiceImage = 'assets/images/dice-$diceRoll.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          // ボタンを押されたら実行される関数を指定(実行ではなく、参照先の関数名を指定)
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
