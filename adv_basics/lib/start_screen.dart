import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            //不透明度を指定する方法2:Color.withOpacity()を使う
            // color: Colors.white.withOpacity(0.1),
            
            //不透明度を指定する方法3:Color.fromARGB()を使う
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          //不透明度を指定する方法1:Opacityウィジェットでラップする
          // 小規模なアプリであればこのやり方でも問題ないが、避けた方が良い
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),

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
            onPressed: () {},
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
