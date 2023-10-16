import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';

  // ユーザが選択した回答群を保持するリスト
  /* Advance1:
  Stateクラス自体がprivateなので不要だが、プライベート変数にもできる
  今後privateでないクラス内で、変数や関数に対し適切に設定すべき
  */
  final List<String> _selectedAnswers = [];

  // setState()を利用して表示画面を更新するメソッド
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // ユーザが選択した回答を回答群リストに追加するメソッド
  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    // 回答群リストの数が問題と同じ数に達したら、結果画面に遷移する
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  // 結果画面からスタート画面に戻る処理
  void restartQuiz() {
    setState(() {
      // ユーザが選択した回答群をリセットする
      // finalを削除して=[]を再代入するより、この方が良さげ
      _selectedAnswers.clear();
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      // コンストラクタ引数でchooseAnswer()メソッド(のポインタ)を渡す
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    else // 講師はここでelseを書いていないが、挙動は同じ
    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        // ここに直接ロジックを書かず、build()メソッドの外に定義
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 68, 5, 113),
              Color.fromARGB(255, 198, 28, 201),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
