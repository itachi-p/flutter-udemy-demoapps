import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

// class GradientContainer extends StatelessWidget {
//   // 呼び出し元から複数の色指定をList<Color>型で受け取る
//   // const GradientContainer(this.colors, {super.key});
//   // 位置引数の場合は不要だが、名前付き引数はデフォルトではnullになるため、requiredが必要
//   const GradientContainer({super.key, required this.colors});

//   final List<Color> colors;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: colors,
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyledText('This is a New Text.')
//       ),
//     );
//   }
// }

// リスト型のColorを受け取るのとは別のアプローチ例
// 名前付き引数ではなく、位置引数で受け取る（2色の指定は自動的に必須になる）
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyledText('This is a New Text.')
      ),
    );
  }
}
