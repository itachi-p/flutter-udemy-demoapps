# Udemy Course: `Flutter & Dart - The Complete Guide [2023 Edition]`

A Complete Guide to the Flutter SDK & Flutter Framework for building native iOS and Android apps  
[Flutter & Dart - The Complete Guide [2023 Edition]](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/)

## 学習方針(考え方)

- [ ] チュートリアルや写経でも『The Art of Readable Code』の考えを反映する
  - 講師による変数の命名にも改善余地を見出す
  - 逆に疑問を感じた書き方に対し、なぜ講師がそうしているのかを考える
  - 「良いコード」とは誰が見てもわかりやすいコード
  - 変数名や関数名、コメントの書き方、インデントや改行の入れ方を工夫する
  - コメントに関して現状は「自身の理解度、知識定着度」優先だが、開発現場想定では「他人(或いは半年後の自分)にとっての理解しやすさ」を優先する

- [x] とにかく丁寧に学習モード
  - 学習速度や成果物作成進度は更に落ちるが、英語の学習(hearing, reading)を兼ね英語音声＋英語字幕で視聴する
    - 英語の音声と字幕の聴覚・視覚情報を入れながら同時に脳内で**日本語翻訳しない**
    - **英語の語順通り前から順に理解**していく。未知の**単語だけ**調べる
    - 単語を調べても意味が通らない場合のみ、慣用句(だいたい2~5ワード)或いは**最大1文節**を翻訳する
- [ ] ひたすらスピード！速さは正義！モード
  - (GitHub Copilotの提案を最大限活用し)爆速でコードを書く
  - おそらく実務で要求されるのはこっちがメイン
  - 限られた時間内で一定以上の成果を上げる為にはマスト
- [ ] 上記2つのモードをええ塩梅で切り替える器用さと判断力
  - 日々の訓練あるのみ
  - 完璧じゃなくても先週・先月・四半期前・去年よりはできるようになる
  - "Don't think. feel！ It's like a finger pointing away to the moon. Don't concentrate on the finger, or you will miss all the heavenly glory." by 青3

---

**main contains:**

## Section 1: Introduction

- [x] environment building on Macbook Pro(Flutter1 -> Flutter3)
- [x] Emulator setup (Android - Android Studio)
- [x] Emulator setup (iOS - Xcode - CocoaPods)
- [x] create a new project (first_app)
- [x] run the app on emulator (Mainly Android 13)
- [x] run the app on emulator (iOS 17.0)

## Section 2: Flutter(Dart) Basics 1 - [RoleDiceApp]

- [x] Dart Basics
- [x] Flutter Basics
- [x] Stateless Widgets
- [x] Stateful Widgets

## Section 3: Flutter(Dart) Basics 2 - [QuizApp]

- [x] Use initState()
- [x] Separation of Data Model & UI
- [x] Using Third-Party Packages
- [x] Custom Fonts & Adding Icons
- [x] Passing Callback Functions Around
- [x] Mapping Lists to Widgets
- [x] List&gt;Map&lt; type is shared among widgets
- [x] Accessing Map values & Using type casting
- [x] Using the Spread Operator
- [x] Combination of columns and rows, wrapped in Expanded
- [x] Filtering & Analyzing Lists
- [x] Making content scrollable

## Section 4: Debugging Flutter Apps (Using Debug Tools)

- [x] Debugging apps & Using debug mode
- [x] Working with the Flutter DevTools
  - [x] **Open DevTools in Web Browser**
    - [x] Using the **Flutter Widget Inspector**
    - [ ] _Logging_
    - [ ] _Network_
    - [ ] Performance (Need to run in profile mode)
    - [ ] Debugger
    - [ ] Other Analysis Tools(Pages)
- [ ] Running the app on a physical devices
  - [x] 以前(Flutter Ver.1で)Android, iPhone実機どっちもやった
  - [ ] On actual Android device
  - [x] On actual iOS device
    - [x] 手持ちのiPhone Xrにて実機テスト
      - プロジェクトごとにホームディレクトリにて`flutter build ios`を実行
      - [x] XCode15.0.1からの実機テスト成功
      - [x] VSCodeからの実機テスト成功(**こちらを優先使用**)

## Section 5: Adding Interactivity & Theming [ExpenseTrackerApp1]

- [x] Using third package:UUID (generate unique id)
- [x] Views
  - [x] List
  - [x] & Chart
- [x] Implementation of **Modal Overlays**
- [x] スワイプ(削除)機能の実装
- [x] スナックバーの実装(スワイプ削除時のアンドゥ機能)  
- [x] Using Flutter Themes

## Section 6: Building Responsive & Adaptive User Interfaces[ExpenseTrackerApp2)]

- !**NOT** _Responsi"ble"_
- Flutter3はMacOS, Windows, Linux, Webブラウザも全対応だが、基本モバイルアプリ版で想定
- [x] デバイスの向きに合わせない(特定方向に固定する)方法
- [x] ユーザーの使用環境に応じてUIを最適化する
  - [x] デバイスの向き(縦 portrait mode・横 landscape mode)を検出
  - [x] ランドスケープモードではチャートを左、リストを右に表示する
  - [x] デバイスのサイズ(スマホ・タブレット・PC)
    - [x] ポートレートモードでも十分な幅があればチャートは左に表示
- [x] Building Adaptive Widgets
  - [x] デバイスのOS(Android・iOS・Web)

## Section 7: Flutter & Dart Internal[TodoApp]

Flutterの内部構造を理解する(TodoAppはむしろ題材)

- 開発者が直接意識するのはWidget Treeのみ
- 記述したコード→メモリ最適化→差分の比較→最終的にUI描画
- [x] 三つのツリー構造
  - [x] Widget Tree
  - [x] Element Tree
  - [x] Render Tree
- [x] main(runApp), build, setStateの流れを舞台裏も含め理解する
- [x] Understanding the "key" property
- [x] Mutating Values **in Memory**
- [x] Make sense of _var_, final & const

## Sec8~10: [MealsApp]

### Sec8: Navigation & Multiple Screens

- [x] Using GridView
- [ ] Page navigation with tabs, side drawers, and stack-based navigation

### Sec9: Managing App-wide State

### Sec10: Adding animations

- [ ] _Adding beautiful animations & page transitions_

## Sec11: [ShoppingListApp1]

- [ ] Handling and _validating user input_

## Sec12: [ShoppingListApp2]

- [ ] _Connecting to backend servers_ by sending HTTP requests

## Sec13: Using Native Device Features(e.g.,Camera) [FavoritePlacesApp]

- [ ] **Using native device features like the camera**
- [ ] **Adding Google Maps**
- [ ] _Image upload_

## Sec14: [ChatApp]

- [ ] Firebase & Firestore
- [ ] **User authentication**
- [ ] **Push notifications** - _manual approach_ and **automated**


### What I'll learn later

- State management solutions
- **Not** using StatefulWidget
- Creating original apps!
- Design
- Management
- And much more
