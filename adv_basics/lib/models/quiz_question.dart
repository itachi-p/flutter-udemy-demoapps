// ウィジェットではなく、クイズの問題と回答群を表すデータモデル
class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  // 問題文
  final String question;
  // 回答群のリスト
  final List<String> answers;
}