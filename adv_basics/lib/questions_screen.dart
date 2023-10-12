import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      // できるだけ横幅いっぱいに広げる
      width: double.infinity,
      child: Column(
        // 縦軸の中央に配置する
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The questions...'),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 1'),
          ),
                  ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 3'),
          ),
    
        ],
      ),
    );
  }
}
