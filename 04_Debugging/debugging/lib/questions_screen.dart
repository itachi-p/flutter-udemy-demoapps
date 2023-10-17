import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:debugging/answer_button.dart';
import 'package:debugging/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    // Resolved: Fix the variable 'currentQuestionIndex' to be 0-based
    // ランタイムエラーの直接の原因は、currentQuestionIndexが6になること
    // しかしその原因は、selectedAnswersがリセットされずに6×2=12個まで増えること
    // 結果、2周目の最後の回答時に本来0~5の範囲の筈のcurrentQuestionIndexが6になる
    // indexが6のquestions[6]は存在しないため、RangeErrorが発生する
    // 適切な場所(結果画面→再スタート時)で0にカウンターリセットが必要
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
