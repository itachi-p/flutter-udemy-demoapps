import 'package:flutter/material.dart';

import 'package:flutter_internals/demo_buttons.dart';

// Refactor:ボタン切り出しによりState管理も不要になったので、StatelessWidgetに変更
class UIUpdatesDemo extends StatelessWidget {
  const UIUpdatesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Every Flutter developer should have a basic understanding of Flutter\'s internals!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Do you understand how Flutter updates UIs?',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            // Refactor:変更の可能性がある部分のみを外部切り出し
            DemoButtons(),
          ],
        ),
      ),
    );
  }
}
