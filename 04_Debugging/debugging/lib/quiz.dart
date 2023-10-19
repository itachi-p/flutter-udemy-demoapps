import 'package:flutter/material.dart';

import 'package:debugging/start_screen.dart';
import 'package:debugging/questions_screen.dart';
import 'package:debugging/data/questions.dart';
import 'package:debugging/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // ここをfinalにするか、しないのか？(どっちでも正常に動作はする)
  final List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    // この変数がリセットされないために、2周目の最後の回答時に累積で12個になる
    _selectedAnswers.add(answer);

    // この条件式は1周目ではtrueだが、2周目では12 == 6でfalseになる
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  // 2周目(以降)を始める際にはこの関数が必ず呼ばれる
  void restartQuiz() {
    setState(() {
      _activeScreen = 'questions-screen';
      // Solution: Reset the selected answers to 0
      // 解決策はここ(または2周目最初の質問に回答するまでの間)でのリセット
      // _selectedAnswers = [];
      // or 空の配列を再代入する代わりに、clear()メソッドを使う
      // この場合、_selectedAnswersはfinalにできる
      _selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
