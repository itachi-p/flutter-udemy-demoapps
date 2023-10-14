import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers, {super.key});

  final List<String> selectedAnswers;

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
            'Your result:',
            style: TextStyle(
              color:  Color.fromARGB(255, 241, 216, 249),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            '${selectedAnswers.where((answer) => answer == 'correct').length} / ${selectedAnswers.length}',
            style: const TextStyle(
              color:  Color.fromARGB(255, 206, 218, 119),
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}