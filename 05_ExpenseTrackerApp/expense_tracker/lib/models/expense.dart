import 'package:uuid/uuid.dart';
// uuidパッケージを使用して、一意なIDを生成する為のインスタンスを作成
final uuid = Uuid();

// ダミーのデータを登録しておくデータモデルクラス
class Expense {
  // 引数が多いので、名前付きコンストラクタを使用
  Expense({
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4(); // initilizer list
  /* initilizer listは、コンストラクタの引数として渡されない変数の初期化に使用
  一意なIDのような(ユーザーが触る必要のない)クラス変数などの初期化に使用すると良い
  */

  // 後で操作する為の一意な固有ID(int型でも良いが、String型で作成)
  final String id;
  final String title;
  final double amount;
  final DateTime date;
}