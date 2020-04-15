import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeHandler;

  TransactionList(this.transactions, this.removeHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      "No transactions added yet!",
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Dismissible(
                    key: Key(transactions[index].id),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      padding: EdgeInsets.only(left: 10),
                      color: Theme.of(context).errorColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Delete",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.green,
                    ),
                    onDismissed: (direction) {
                      removeHandler(transactions[index].id);
                    },
                    child: Container(                      
                      decoration: BoxDecoration(color: Colors.white),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FittedBox(
                              child: Text('\$${transactions[index].amount}'),
                            ),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                        ),
                        trailing: MediaQuery.of(context).size.width > 460
                            ? FlatButton.icon(
                                textColor: Theme.of(context).errorColor,
                                icon: Icon(Icons.delete),
                                label: Text("Delete"),
                                onPressed: ()=> removeHandler(transactions[index].id),
                              )
                            : IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  removeHandler(transactions[index].id);
                                },
                                color: Theme.of(context).errorColor,
                              ),
                      ),
                    ),
                  ),
                );
                //return TransactionCard(transactions[index]);
              },
              itemCount: transactions.length),
    );
  }
}
