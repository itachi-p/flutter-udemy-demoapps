import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    // スタート画面に戻る為のコールバック関数を引数に追加
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  // final void Function() onRestart;
  // 以下も同じ。VoidCallback型は引数と戻り値がない関数の型
  final VoidCallback onRestart;

  /* Advance2-1a:
  入力値やパラメータを受け取らず、クラスの別のプロパティ(ここではchosenAnswers)に基づいた
  データを変換するだけの関数は、Dartのget構文を利用し簡易にゲッターとして実装できる
  関数定義の中身は全く同じでもよい。呼び出す際に変数やプロパティと同じように扱える
  */
  //List<Map<String, Object>> getSummaryData() {
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      // Key(String型)とValueのペアからなるMapを作成し、リストに追加
      summary.add({
        'question_index': i,
        'question_text': questions[i].question,
        // (シャッフルする前の)先頭の回答が常に正解という設計
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    /* Advance2-1b:
    get構文により、代入無しでプロパティのようにデータにアクセスできる
    ここではこの行を削除するだけで、下部でsummaryData.where()のように使えている
    */
    // final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;

    // where()メソッドを使い条件に合致する(true)要素を抽出し、その数を数える
    /* Advance3:
    アロー関数(省略記法):(引数) => 関数の中身
    特に無名関数の定義でwhereやmapのようなリストメソッドを使う際に有用
    関数の中身が1行の場合、{}やreturnキーワードを省略できる
    */
    final numCorrectAnswers = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;
    // final numCorrectAnswers = summaryData.where((data) {
    //   return data['user_answer'] == data['correct_answer'];
    // }).length; // 抽出した要素の数を取得する

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // 上で関数を呼び出しサマリーデータを取得したので、それを再利用する
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            // 戻るボタンを実装、テキストの左側にはアイコンを表示する
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
