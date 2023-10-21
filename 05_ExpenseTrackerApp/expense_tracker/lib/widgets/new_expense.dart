import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // 入力されたタイトルを保存する
  var _enteredTitle = '';
  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // テキストが入力された際に呼ばれるコールバック関数
            onChanged: _saveTitleInput,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
              // 以下でも同じ
              // labelText: 'Title',
            ),
            keyboardType: TextInputType.text, // default
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Test:とりあえず入力値をコンソールに出力してみる
                  print(_enteredTitle);
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
