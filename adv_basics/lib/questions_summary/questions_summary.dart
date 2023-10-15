import 'package:flutter/material.dart';

import 'package:adv_basics/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
// results_screenのsummaryをここに移植する
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // 高さを固定した上で、スクロール可能にする
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          // map()メソッドの引数は、リストの要素を1つずつ取り出し処理する無名関数
          // 要素を順に渡し、戻り値をリストに追加する
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
            // 厳密にはmap()の戻り値はIterable型なので、List型への変換が必要
          ).toList(),
          // 上記の省略形(引数名はdata, element等なんでもいい)
          // children: summaryData.map((e) => SummaryItem(e)).toList(),
        ),
      ),
    );
  }
}
