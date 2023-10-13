import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // コンストラクタ引数でQuizクラスのswitchScreen()メソッドを呼び出すポインタを受け取る
  const StartScreen(this.startQuiz, {super.key});
  // 受け取ったstartQuiz(switchScreen())をこのクラスでも関数として利用できるよう紐付ける
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
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.nabla(
              color: const Color.fromARGB(255, 241, 216, 249),
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
