import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// intlパッケージを使用して、日付をフォーマットする為のインスタンスを作成
final formatter = DateFormat.yMd();

// uuidパッケージを使用して、一意なIDを生成する為のインスタンスを作成
const uuid = Uuid();

// 経費のカテゴリーを表すenum(列挙型)のカスタムデータ型
enum Category {
  food,
  travel,
  leisure,
  work,
}

// カテゴリアイコンを設定
// Keyにはenum Categoryの値を、ValueにはIconウィジェットを設定
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

// 経費データを登録しておくデータモデルクラス
class Expense {
  // 引数が多いので、全てに名前付きコンストラクタを使用
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // initilizer list
  /* initilizer listは、コンストラクタの引数として渡されない変数の初期化に使用
  一意なIDのような(ユーザーが触る必要のない)クラス変数などの初期化に使用すると良い
  */

  // 後で操作する為の一意な固有ID(int型でも良いが、String型で作成)
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

// 時刻データの表示形式を整形するゲッター
  String get formattedDate {
    return formatter.format(date);
  }
}
