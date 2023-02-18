// ignore_for_file: file_names

import 'package:expencemanger/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types, must_be_immutable
class transactionList extends StatelessWidget {
  List<transaction> transactions;
  final Function deleteTx;
  transactionList(
      {super.key, required this.transactions, required this.deleteTx});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return transactions.isEmpty
        ? Column(
            children: const [
              Center(
                child: Text(
                  'No Transactions added yet!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          //shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.purple, width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: FittedBox(
                        child: Text(
                          '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.purple),
                              
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.56,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat().format(transactions[index].date),
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: IconButton(
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.grey,
                          )),
                    )
                  ],
                ),
              );
            });
  }
}
