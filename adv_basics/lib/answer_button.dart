import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    // 別に位置変数で構わないが、名前付き位置変数を使うことで、
    // 呼び出し時にどの引数がどの値に対応するのかを明示的にできる
    required this.answerText,
    required this.onTapped,
  });

  final String answerText;
  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // ボタンが押される度にonTapped()メソッドが呼び出される
      onPressed: onTapped,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 36, 6, 81),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(answerText, textAlign: TextAlign.center),
    );
  }
}
