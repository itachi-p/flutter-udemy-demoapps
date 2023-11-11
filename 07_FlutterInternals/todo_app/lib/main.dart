import 'package:flutter/material.dart';

// import 'package:flutter_internals/ui_updates_demo.dart';
import 'package:flutter_internals/keys/keys.dart';

void main() {
  // finalで宣言した変数に「再代入」はできない
  final numbers = [1, 2, 3];
  // これは別のメモリアドレスを割り当てる操作になるため不可
  // numbers = [4, 5, 6];

  // ただしここで変数はリストのメモリ番地を指すポインタであるため、
  // ポインタが指す先の同じメモリアドレスにある要素の変更は可能
  // constはいずれも不可。コンパイルエラーは出ないが、実行時エラーになる
  numbers.add(4);
  numbers[0] = 5;
  print(numbers);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals'),
        ),
        // ui_updates_demo.dartに換わって、keys.dartを表示
        body: const Keys(),
      ),
    );
  }
}
