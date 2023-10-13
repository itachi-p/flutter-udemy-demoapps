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
  // Stateとして現在の問題番号を保持し、番号に応じた問題を取得する
  int currentQuestionIndex = 0;
  // 回答が選ばれたらその回答番号を保存し、次の問題に進む
  // (現時点では回答の保存と最後の問題に達した時の処理は実装していない)
  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    // クイズデータにアクセスする
    final currentQuestion = questions[currentQuestionIndex];

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
            // 回答群の文字列リストをAnswerButtonウィジェットのリストに変換し、展開する
            // 更にランダムに並び替えたいが、shuffle()メソッドは元のリストを上書きしてしまう
            // 正解が確認できなくなるので、元のクラス側で回答群のコピーをシャッフルするメソッドを実装する
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTapped: answerQuestion,
              );
            }),
          ],
        ),
      ),
    );
  }
}
