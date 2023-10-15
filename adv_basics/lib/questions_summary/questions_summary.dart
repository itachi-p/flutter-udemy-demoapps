import 'package:flutter/material.dart';

import 'package:adv_basics/questions_summary/summary_item.dart';

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
          children:
              // map()メソッドの引数は、リストの要素を1つずつ取り出し処理する無名関数
              // 要素を1つづつ引数dataとして渡し、SummaryItem(data)の戻り値をリストに追加する
              summaryData
                  .map((data) => SummaryItem(data))
                  // 厳密にはmap()の戻り値はIterable型なので、List型への変換が必要
                  .toList(),
        ),
      ),
    );
  }
}
