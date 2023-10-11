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
  // 現在の表示画面(ウィジェット)を保持する変数
  // initState()によって初期化される前の最初期値はNull許容型にするしかない
  Widget? activeScreen;

  // このクラスのインスタンスが生成された直後に1回だけ実行される初期化処理
  @override
  void initState() {
    // これは先頭に置き、下手に触らない方が良い
    super.initState();
    // build()メソッドより前に、1回だけの初期化処理を実行する
    // StartScreen内で使えるように、switchScreen()メソッドのポインタを引数で渡す
    activeScreen = StartScreen(switchScreen);
  }

  // setState()を利用してactiveScreenを更新するメソッド
  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
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
          // StartScreenウィジェットを固定で表示する場合
          // child: const StartScreen(),
          // activeScreen変数に格納されているウィジェットを表示する
          child: activeScreen,
        ),
      ),
    );
  }
}