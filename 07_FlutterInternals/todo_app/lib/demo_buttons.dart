import 'package:flutter/material.dart';

// Refactor:Stateにより影響を受ける最小範囲のみをStatefulWidgetとして切り出し、
// それ以外はStatelessWidgetに戻すのが一般的にベストプラクティスとされている。
class DemoButtons extends StatefulWidget {
  const DemoButtons({super.key});

  @override
  State<DemoButtons> createState() {
    return _DemoButtonsState();
  }
}

class _DemoButtonsState extends State<DemoButtons> {
  var _isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    // ボタンを押した場合、このbuildメソッドだけが呼ばれる。
    // 『The Art of Readable Code』にもあるように、小さなメソッドに分割する事で、
    // 可読性の向上や再利用性、変更に強くなるだけでなく、パフォーマンスの向上にも繋がる。
    print('DemoButtons BUILD called');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
        // Refactor:Stateが更新された時に描画変更の可能性があるのはここだけなので、
        // buildの度にそれ以外の全要素もチェックされるのは負担が大きく、望ましくない。
        if (_isUnderstood) const Text('Awesome!'),
      ],
    );
  }
}
