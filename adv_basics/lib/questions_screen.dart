import 'package:flutter/material.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

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
    // クイズデータにアクセスする
    final currentQuestion = questions[0];

    return SizedBox(
      // できるだけ横幅いっぱいに広げる
      width: double.infinity,
      child: Container(
        // 全ての要素間の余白(マージン)を一律に設定する
        margin: const EdgeInsets.all(40),
        child: Column(
          // Columnの子要素を縦軸の中央に配置する
          mainAxisAlignment: MainAxisAlignment.center,
          // 横軸も画面幅いっぱいに伸ばす
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // 回答群の文字列リストをAnswerButtonウィジェットのリストに変換する
            // さらに、childrenが求めているのはList型ではなく単一のウィジェットなので、
            // map()メソッドの戻り値であるリスト(厳密にはIterable型)を...演算子で展開する
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTapped: () {},
              );
            }),
          ],
        ),
      ),
    );
  }
}
