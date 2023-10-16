// ウィジェットではなく、クイズの問題と回答群を表すデータモデル
class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  // 問題文
  final String question;
  // 回答群のリスト
  final List<String> answers;

  // 回答群をランダムに並び替えるメソッド
  /* Advance2-2a:
  Dartのget構文を利用し、ゲッターとして書き換える
  */
  List<String> get shuffledAnswers {
  // List<String> getShuffledAnswers() {
    // 常に回答群の最初が正解という仕様なので、元の並び順は保持したい
    // まずanswersのコピーを作成し、それに対しshuffle()メソッドを実行する
    final shuffledList = List.of(answers);
    // void shuffle()で結果を返さないので、そのまま=では代入できない
    shuffledList.shuffle();
    return shuffledList;
  }
}
