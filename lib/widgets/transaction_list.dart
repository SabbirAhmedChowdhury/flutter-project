import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transacion> transactions;
  final Function deleteTX;

  TransactionList(
    this.transactions,
    this.deleteTX,
  );

  @override
  Widget build(BuildContext context) {
    print('build() transaction_list');
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, contstraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: contstraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(
                    '${transactions[index].title}',
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                      '${DateFormat.yMMMd().format(transactions[index].date)}'),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? FlatButton.icon(
                          icon: Icon(Icons.delete),
                          label: const Text('Delete'),
                          textColor: Theme.of(context).errorColor,
                          onPressed: () => deleteTX(transactions[index].id),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          onPressed: () => deleteTX(transactions[index].id),
                        ),
                ),
              );
              // return Card(
              //     child: Row(
              //   children: <Widget>[
              //     Container(
              //       margin: EdgeInsets.symmetric(
              //         horizontal: 15,
              //         vertical: 10,
              //       ),
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: Theme.of(context).primaryColorDark,
              //           width: 2,
              //         ),
              //       ),
              //       padding: EdgeInsets.all(10),
              //       child: Text(
              //         '\$${transactions[index].amount.toStringAsFixed(2)}',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20,
              //           color: Theme.of(context).primaryColorDark,
              //         ),
              //       ),
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         Text(
              //           transactions[index].title,
              //           style: Theme.of(context).textTheme.title,
              //         ),
              //         Text(
              //           DateFormat.yMMMEd().format(transactions[index].date),
              //           style: TextStyle(
              //             color: Colors.grey,
              //           ),
              //         ),
              //       ],
              //     )
              //   ],
              // ));
            },
            itemCount: transactions.length,
          );
  }
}
