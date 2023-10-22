import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // ユーザ入力値を処理する方法2(Flutterのシステムに組み込まれた機能を使用)
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  // ただし、この方法は必要がなくなってもメモリに生き続ける可能性があるので、
  // ウィジェットが破棄される際に、コントローラーを明示的に破棄する必要がある
  @override
  void dispose() {
    // ここでユーザー入力値のコントローラを破棄する
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // onChangedに関数を渡す代わりに、コントローラを使用する
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
              // 以下でも同じ
              // labelText: 'Title',
            ),
            keyboardType: TextInputType.text, // default
          ),
          TextField(
            controller: _amountController,
            maxLength: 10,
            decoration: const InputDecoration(
              prefixText: '\$ ', // 先頭に$を表示(特殊記号なのでエスケープが必要)
              labelText: 'Amount',
            ),
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Test:とりあえず入力値をコンソールに出力してみる
                  print("title:" + _titleController.text);
                  print("amount:" + _amountController.text);
                },
                child: const Text('Save Expense'),
              ),
              const SizedBox(width: 8),
              // キャンセルボタン
              ElevatedButton(
                onPressed: () {
                  // モーダルシートを閉じる
                  // Navigator.of(context).pop();
                  //以下も同じ
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
