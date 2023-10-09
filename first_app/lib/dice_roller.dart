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
  // ダイスの画像パスではなく、変化する「現在の出目」だけの変数に変更
  var currentDiceRoll = 2;

  // ボタンを押されたら実行される関数を定義
  void rollDice() {
    // setState()を呼び出すことで、変化する状態を管理するクラスのbuild()が再実行される
    setState(() {
      // これでも動作するが、diceRollの度に新しいRandomインスタンスを生成しており、メモリ最適化の観点上は無駄
      currentDiceRoll = Random().nextInt(6) + 1; // 1〜6の乱数を生成
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          // 表示する画像を動的に変更
          'assets/images/dice-$currentDiceRoll.png',
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
