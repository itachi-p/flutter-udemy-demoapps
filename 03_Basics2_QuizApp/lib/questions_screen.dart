import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  // コンストラクタ引数でQuizクラスのchooseAnswer()メソッドのポインタを受け取る
  //const QuestionsScreen(this.onSelectAnswer, {super.key});
  // 位置引数でも実現するが、Flutterの慣習に従い、名前付き引数で実装する
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer; 
  
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // Stateとして現在の問題番号を保持し、番号に応じた問題を取得する
  int currentQuestionIndex = 0;
  // 回答が選ばれたらその回答番号を保存し、次の問題に進む
  void answerQuestion(String selectedAnswer) {
    // StateクラスからStatefulWidgetクラスのメンバにアクセスする
    widget.onSelectAnswer(selectedAnswer);

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
              // GoogleFontsパッケージを利用して、Google Fontsからダウンロードしたフォントを利用する
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 224, 126, 244),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // 回答群の文字列リストをAnswerButtonウィジェットのリストに変換し、展開
            /* Advance2-2b:
            get構文で再定義したので、呼び出し元でプロパティのようにアクセスできる
            正直ここでは然程メリットはないが、プロパティのように扱える恩恵は大きい
            */
            ...currentQuestion.shuffledAnswers.map((answer) {
            // ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                //onTapped: answerQuestion,
                // onTappedは引数なしの関数を要求するので匿名関数に置き換える
                onTapped: () => {
                  // 選択された回答をQuizクラスのchooseAnswer()メソッドに渡す
                  answerQuestion(answer),
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
