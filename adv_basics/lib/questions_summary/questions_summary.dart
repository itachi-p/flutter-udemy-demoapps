import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/questions_summary/question_identifier.dart';

class QuestionsSummary extends StatelessWidget {
// results_screenのsummaryをここに移植する
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // Mapオブジェクトのリストから、ウィジェットのリストに変換する
    return SizedBox(
      // 高さを固定した上で、スクロール可能にする
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          // map()メソッドの引数は、リストの要素を1つずつ受け取る無名関数
          children: summaryData.map(
            (data) {
              // ユーザの回答と正解が一致するかどうかを判定し、変数に格納
              final isCorrectAnswer =
                  data['user_answer'] == data['correct_answer'];

              return Row(
                children: [
                  // Map<String, Object>のKeyを指定し、Valueを適切な型にキャストする

                  // 正解の場合は青色、不正解の場合は赤色の丸で囲まれた問題番号を表示する
                  QuestionIdentifier(
                    questionIndex: data['question_index'] as int,
                    isCorrectAnswer: isCorrectAnswer,
                  ),
                  const SizedBox(width: 10),
                  // 縦→横→縦とさらに入れ子にする(Column>Row>Column)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question_text'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 5),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(color: Colors.green),
                        ),
                        Text(data['correct_answer'] as String,
                            style: const TextStyle(color: Colors.lightBlue)),
                      ],
                    ),
                  ),
                ],
              );
            },
            // 厳密には戻り値がIterable<Widget>なので、toList()でList型に変換する
          ).toList(),
        ),
      ),
    );
  }
}
