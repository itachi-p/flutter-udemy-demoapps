import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  // 新しい経費をexpensesのリストに追加する為のプロパティ
  // 命名パターンの理由は、あるイベント発生時に実行される関数であることを示す為
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  // ユーザが日付ピッカーから選択した時点で値が入る変数(Null許容型にする)
  DateTime? _selectedDate;
  // カテゴリーのドロップダウンリストで選択された値を格納する変数
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    // ここでユーザー入力値のコントローラを破棄する
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    //　ユーザが将来的に日付を選択する前提で、非同期処理を行う
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate!;
    });
  }

  // ユーザの入力値をバリデーションした上で、経費を送信する関数
  void _submitExpenseData() {
    // 金額もテキストになっているので、まずはdouble型に変換を試みる
    final enteredAmount = double.tryParse(_amountController.text);
    // 金額の入力値が不正かどうか(double型に変換できないか、0以下の値が入力された場合)
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    // 入力値をまとめてチェック
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category were entered..'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      // ここでreturnを書かないと、ダイアログが表示された後に登録処理が実行されてしまう
      return;
    }
    // バリデーションを通過した場合、経費データを登録する
    // Expensesクラスから親ウィジェットに渡されたonAddExpense関数を呼び出す
    widget.onAddExpense( // Stateクラス内からStatefulWidgetクラスのプロパティにアクセス
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!, // Null許容型変数なので、Dartに絶対Nullでないと伝える
        category: _selectedCategory,
      ),
    );
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
            ),
          ),
          Row(children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                  prefixText: '\$ ', // 先頭に$を表示(エスケープが必要)
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 三項式でnullチェックを行い、!を付けDartに絶対Nullでないことを伝える
                  Text(_selectedDate == null
                      ? 'No date selected'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  )
                ],
              ),
            )
          ]),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  // ドロップダウンで選択された値をStateに保存する
                  setState(() {
                    _selectedCategory = value as Category;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // モーダルシートを閉じる
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
