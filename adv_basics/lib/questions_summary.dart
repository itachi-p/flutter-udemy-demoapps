import 'dart:ffi';

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
// results_screenのsummaryをここに移植する
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    // サマリーデータを使って、問題文と回答を表示するウィジェットを作成する
    // Mapオブジェクトのリストから、ウィジェットのリストに変換する
    return Column(
      // map()メソッドの引数は、リストの要素を1つずつ受け取る無名関数
      children: summaryData.map(
        (data) {
        // 横長に並べる
        return Row(children: [
          // Map<String, Object>のKeyを指定し、Valueを適切な型にキャストする
          // 問題番号は0から始まる数値なので、1を足した後で文字列に変換する
          Text(((data['question_index'] as int) + 1).toString()),
        ],);
        // 厳密には戻り値がIterable<Widget>なので、toList()でList型ïに変換する
      },).toList(),
    );
  }
}
