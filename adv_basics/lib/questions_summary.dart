import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              // 横長に並べる(Columnの中に入れ子でRowを作成する)
              return Row(
                children: [
                  // Map<String, Object>のKeyを指定し、Valueを適切な型にキャストする
                  Text(((data['question_index'] as int) + 1).toString()),
                  // 縦→横→縦とさらに入れ子にする(Column>Row>Column)
                  Expanded(
                    child: Column(
                      children: [
                        Text(data['question_text'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 224, 126, 244),
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
              // 厳密には戻り値がIterable<Widget>なので、toList()でList型ïに変換する
            },
          ).toList(),
        ),
      ),
    );
  }
}
