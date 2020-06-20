import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactionsList;
  final Function deleteTx;

  TransactionsList(this.transactionsList, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final themeContext = Theme.of(context);
     
    return transactionsList.isEmpty
        ? LayoutBuilder(builder: (context, constraint) {
            return Column(
              children: <Widget>[
                Text('No Transactions added yet',
                    style: themeContext.textTheme.headline6),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: constraint.maxHeight * 0.5,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                shadowColor: themeContext.accentColor,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: ListTile(
                  trailing: mediaQuery.size.width > 450
                      ? FlatButton.icon(
                          onPressed: () => deleteTx(transactionsList[index].id),
                          textColor: themeContext.errorColor,
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: themeContext.errorColor,
                          onPressed: () => deleteTx(transactionsList[index].id),
                        ),
                  leading: Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                      color: themeContext.primaryColorLight,
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
                      style: themeContext.textTheme.headline6,
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
          );
  }
}
