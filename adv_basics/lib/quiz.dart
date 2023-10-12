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

  // setState()を利用してactiveScreenを更新するメソッド
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    // 画面切り替えの方法3:build()メソッドの最初で条件分岐する
    // ウィジェット・ツリー内部で条件分岐を記述するより可読性が高い
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
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
            )
            ),
          // インスタンス変数screenWidgetにより画面切り替えを実現する
          child: screenWidget,
        ),
      ),
    );
  }
}