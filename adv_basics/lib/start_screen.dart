import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  // QuizクラスのswitchScreen()メソッドを呼び出すためのポインタを受け取る
  const StartScreen(this.startQuiz, {super.key});
  // 受け取ったstartQuizをこのクラスでも関数として利用できるように紐付ける
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 241, 216, 249),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            // ボタンが押される度にQuizクラスのswitchScreen()メソッドが呼び出される
            onPressed: startQuiz, // 関数の実行結果でなく、関数定義が格納されたポインタを渡す

            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(
                color: Color.fromARGB(255, 206, 218, 119),
                width: 4,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
