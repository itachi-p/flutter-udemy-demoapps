import 'package:flutter/material.dart';

import 'package:adv_basics/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });
  final List<String> chosenAnswers;

  // 答え合わせの為に問題文のリストを取得するメソッド
  // 戻り値は<Key: 項目名, Value: 複数の型の混在>のMapのリスト
  List<Map<String, Object>> getSummaryData(chosenAnswers) {
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
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 上でサマリーが用意できたので、以下のダミーウィジェットを置き換えていく
            // しかしウィジェット・ツリーがかなり複雑になるので、小さなブロックに分割する
            // 何問正解したかを示すテキスト（仮）
            const Text('You answered X out of Y questions correctly!'),
            const SizedBox(height: 30),
            // トップのタイトルと戻るボタンの間でスクロール可能なウィジェット(仮)
            const Text('List of answers and questions...'),
            const SizedBox(height: 30),
            // 戻るボタン
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
