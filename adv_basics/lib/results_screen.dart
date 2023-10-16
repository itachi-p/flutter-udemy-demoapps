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

  // 答え合わせの為に問題文のリストを取得するメソッド(引数不要)
  // 戻り値は<Key: 項目名, Value: 複数の型の混在>のMapのリスト
  List<Map<String, Object>> getSummaryData() {
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
    // 結果画面を動的に生成する為に、サマリーデータを取得する
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    // where()メソッドを使って、条件に合致する(true)要素のみを抽出する
    final numCorrectAnswers = summaryData.where((data) {
      // ユーザの回答と正解が一致するかどうかを判定し、一致するものだけを抽出
      return data['user_answer'] == data['correct_answer'];
    }).length; // 抽出した要素の数を取得する

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
