import 'package:flutter/material.dart';

import 'package:adv_basics/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      // できるだけ横幅いっぱいに広げる
      width: double.infinity,
      child: Column(
        // 縦軸の中央に配置する
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The questions...',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          // 回答ボタンウィジェットにonTapped()メソッドを渡す
          AnswerButton(
            answerText: 'Answer 1',
            onTapped: () {},
          ),
          AnswerButton(
            answerText: 'Answer 2',
            onTapped: () {},
          ),
          AnswerButton(
            answerText: 'Answer 3',
            onTapped: () {},
          ),
        ],
      ),
    );
  }
}
