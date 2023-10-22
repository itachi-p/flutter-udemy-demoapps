import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

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
                  prefixText: '\$ ', // 先頭に$を表示(特殊記号なのでエスケープが必要)
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 16),
            // Rowのデフォルトは取れるスペースを制限していないのでどちらもExpandedで包む
            // そうしないと、Rowの中にRowを入れ子にするとエラーになる(片方だけExpandedでもエラー)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 日付未選択でなければ、選択された日付を表示する
                  // 三項式でnullチェックを行い、!を付けDartに絶対Nullでないことを伝える
                  Text(_selectedDate == null
                      ? 'No date selected'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                    // 日付ピッカーを表示するコールバック関数を渡す
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
                onPressed: () {
                  // Test:とりあえず入力値をコンソールに出力してみる
                  print("title:" + _titleController.text);
                  print("amount:" + _amountController.text);
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
