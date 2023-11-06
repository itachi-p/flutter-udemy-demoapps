import 'package:flutter/material.dart';

class UIUpdatesDemo extends StatefulWidget {
  const UIUpdatesDemo({super.key});

  @override
  // アプリの起動時にウィジェットツリーの全ての要素に対しElementが生成される
  StatefulElement createElement() {
    // 実際には何も追記していないし、余程でない限りオーバーライドする必要もない
    print('UIUpdatesDemo CREATEELEMENT called');
    // ただ開発者は意識せずとも、アプリが起動し最初にインスタンスが生成される際は
    // buildよりも先にcreateElementが呼ばれている(2回目以降のbuild時も呼ばれない)
    // Elementによって変更部分のみを内部で更新し、実際のRenderObject(UI)の差分のみを描画する
    return super.createElement();
  }

  @override
  State<UIUpdatesDemo> createState() {
    return _UIUpdatesDemo();
  }
}

class _UIUpdatesDemo extends State<UIUpdatesDemo> {
  var _isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    // Elementと違い、Stateの更新などWidgetがbuildされる度に呼ばれる
    print('UIUpdatesDemo BUILD called');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Every Flutter developer should have a basic understanding of Flutter\'s internals!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Do you understand how Flutter updates UIs?',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isUnderstood = false;
                    });
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isUnderstood = true;
                    });
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
            // Stateがtrueとfalseで入れ替わった時だけElementとRenderObjectが更新される
            // false>falseやtrue>trueの時はbuildは呼ばれるが、ElementとRenderObjectは更新されない
            if (_isUnderstood) const Text('Awesome!'),
          ],
        ),
      ),
    );
  }
}
