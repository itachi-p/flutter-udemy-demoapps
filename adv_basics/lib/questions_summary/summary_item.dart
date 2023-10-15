import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/questions_summary/question_identifier.dart';

// サマリーの1行(横軸)分のデータを表示するウィジェット
// 元のList<Map<String, Object>>のMapの1要素を順に引数に取る
class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});
  // Object型のValueに対しては、取り出す際に適切な型へキャストが必要
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    // ユーザの回答と正解が一致するかどうかを判定し、変数に格納
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      // 縦方向にだけ8pxの余白を追加
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        // 縦軸の先頭(上端)に配置する
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 正解の場合は青色、不正解の場合は赤色の丸で囲まれた問題番号を表示する
          QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer,
          ),
          const SizedBox(width: 20),
          // 問題文と回答を表示する(全体が表示されるようにExpandedで囲む)
          Expanded(
            child: Column(
              // 横軸の先頭(左端)に配置する
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemData['question_text'] as String,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 5),
                Text(itemData['user_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 194, 164, 229),
                    )),
                Text(itemData['correct_answer'] as String,
                    style: const TextStyle(
                      color: Colors.lightBlue,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
