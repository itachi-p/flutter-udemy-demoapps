# Section 6 expense_tracker2

Section 5で作成したExpense Tracker Appを、Responsiveに対応させる。

- ユーザーの使用環境に応じてUIを最適化する
  - デバイスの向き(縦 portrait mode・横 landscape mode)を検出
  - ランドスケープモードではチャートを左、リストを右に表示する
  - デバイスのサイズ(スマホ・タブレット・PC)
    - ポートレートモードでも十分な幅があればチャートは左に表示
    - つまり、使えるスペースによってColumnかRowかを切り替える

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
