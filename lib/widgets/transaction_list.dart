import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactionsList;

  TransactionsList(this.transactionsList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactionsList.isEmpty
          ? Column(
              children: <Widget>[
                Text('No Transactions added yet',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  shadowColor: Theme.of(context).accentColor,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '€${transactionsList[index].amount}',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.black,
                              fontSize: 14.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                        top: 2,
                      ),
                      child: Text(
                        '${transactionsList[index].title}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('LLLL d, y')
                          .format(transactionsList[index].date),
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                  ),
                );
              },
              itemCount: transactionsList.length,
            ),
    );
  }
}
