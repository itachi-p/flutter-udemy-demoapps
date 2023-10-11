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
  //Widget? activeScreen;
  // 方法2:initState()を必要としないやり方
  // 変数にウィジェットそのものを格納するのでなく、なんらかの識別子を保持する
  String activeScreen = 'start-screen'; // 文字列でなくint型の数字でもOK

  // setState()を利用してactiveScreenを更新するメソッド
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
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
          // 三項演算子:activeScreenの値に応じて表示するウィジェットを切り替える
          child: activeScreen == 'start-screen'
            ? StartScreen(switchScreen) // trueの場合
            : const QuestionsScreen(), // false('questions-screen')の場合
        ),
      ),
    );
  }
}