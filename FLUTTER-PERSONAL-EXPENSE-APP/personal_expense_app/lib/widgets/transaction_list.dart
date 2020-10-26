import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './detail_screen.dart';

//receives data from main.dart from TransactionList(_userTransactions,_deleteTransaction)
class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function
      deleteTx; //receives data from main.dart as stated in above comment. Function name can be anything

  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) { //layout builder is used to set constraints in case we have a fixed height of a widget
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 6,
                child: InkWell(
                  onTap: (){
                    /*print("\$" + transaction[index].amount.toStringAsFixed(2) + " "
                          + transaction[index].title + " " + DateFormat.yMMMd().format(transaction[index].date));*/
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(title: transaction[index].title, amount: "\u20B9" + transaction[index].amount.toStringAsFixed(2))),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            "\u20B9" + " " + transaction[index].amount.toStringAsFixed(2),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.title,
                      /*TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),*/
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                      // added the dependency intl: ^0.16.1 in pubspec.yaml and imported the library
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: MediaQuery.of(context).size.width > 460 ?
                    FlatButton.icon(icon: Icon(Icons.delete_forever),
                        textColor: Theme.of(context).errorColor,
                        label: Text("Delete"),
                        onPressed: () => deleteTx(transaction[index].id)): IconButton(
                      icon: Icon(Icons.delete_forever),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transaction[index].id), // points towards  _deleteTransaction(String id) in main.dart,
                    ),
                  ),
                ),
              );
            },
            itemCount: transaction.length,
          );
  }

}
