import 'package:flutter/material.dart';

// import 'package:flutter_internals/keys/todo_item.dart';
import 'package:flutter_internals/keys/checkable_todo_item.dart';

// データモデル
class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() {
    return _KeysState();
  }
}

class _KeysState extends State<Keys> {
  var _order = 'asc';
  // ダミーデータ
  final _todos = [
    const Todo(
      'Learn Flutter',
      Priority.urgent,
    ),
    const Todo(
      'Practice Flutter',
      Priority.normal,
    ),
    const Todo(
      'Explore other courses',
      Priority.low,
    ),
  ];

  List<Todo> get _orderedTodos {
    // 元のリストを変更しないようにコピーを作成してソート
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            label: Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              // {}波括弧無しループでリストに要素を追加（※前項参照）
              for (final todo in _orderedTodos)
                // TodoItem(
                // チェックボックスのstateは他の要素の並び替え順と整合していない
                // この理由は、widgetが移動(elementからのポインタ参照先が変わる)しても
                // element及びstateはそのまま再利用される(移動しない)ため
                // これを合わせるには、keyを使う
                // widgetのkeyと、elementのkeyの紐付けによりstateの連動も可能になる
                CheckableTodoItem(
                  // 個々のTodoItem(のwidget及びelement)にkeyを設定
                  // 改めてクラス定義に追加は不要。コンストラクタに常時{super.key}と書くのもこの為
                  // もし一意なIDがあればそれを使う方が望ましいが、ここではtodo.textを使う
                  key: ValueKey(todo.text), // これによりチェックボックスのstateも並び順と連動する
                  // key: ObjectKey(todo), // これでもOKだが、オブジェクト全体になるので処理が重くなる
                  todo.text,
                  todo.priority,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
