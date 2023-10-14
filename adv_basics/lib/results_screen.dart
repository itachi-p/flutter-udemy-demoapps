import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });
  // 回答群リストを受け取る
  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
