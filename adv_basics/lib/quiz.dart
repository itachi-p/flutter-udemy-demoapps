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

    // 回答群リストの数が問題と同じ数に達したら、結果画面に遷移する
    if (selectedAnswers.length == questions.length) {
      // 2周目以降selectedAnswersが累積しないよう、finalを取り除き初期化する
      // selectedAnswers = []; // メモリ再割り当てが必要な為finalだとエラー
      // と、動画で講師は説明しているが、finalのままでもリセットは可能
      selectedAnswers.clear(); // こっちの方がよいのでは？
      
      setState(() {
        activeScreen = 'result-screen';
      });
    }
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
    // TODO 動画では講師は何故かここでelseを使っていない。
    if (activeScreen == 'result-screen') {
      screenWidget = const ResultsScreen();
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
