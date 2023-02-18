// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class newTransaction extends StatefulWidget {
  final Function addTx;

  const newTransaction({super.key, required this.addTx});
  @override
  State<newTransaction> createState() => _newTransactionState();
}

// ignore: camel_case_types
class _newTransactionState extends State<newTransaction> {
  final TextEditingController titleInput = TextEditingController();
  final TextEditingController amountInput = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final enteredTitle = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicket(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
         _selectedDate = value;
      });
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleInput,
                onSubmitted: (value) => _submitData(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountInput,
                keyboardType: TextInputType.number,
                onSubmitted: (value) => _submitData(),
              ),
              Row(
                children: [
                   // ignore: unnecessary_null_comparison
                   Expanded(child: Text(_selectedDate == null ?'No Date Chosen!' : DateFormat.yMd().format(_selectedDate))),
                  TextButton(
                      onPressed: () {
                        _presentDatePicket(context);
                      },
                      child: const Text(
                        'Press to Choose Date',
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    _submitData();
                  },
                  child: const Text(
                    'Add Transaction',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
