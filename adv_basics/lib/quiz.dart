import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';

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
  final List<String> selectedAnswers = [];

  // setState()を利用して表示画面を更新するメソッド
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // ユーザが選択した回答を回答群リストに追加するメソッド
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
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
          // インスタンス変数screenWidgetにより画面切り替えを実現する
          child: screenWidget,
        ),
      ),
    );
  }
}
