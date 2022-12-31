import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
// import './transaction_list.dart';

class TransactionList extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);
  final List<Transaction> transactions;
  final Function deleteTx ;

  TransactionList(this.transactions , this.deleteTx);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    // return Container(
    //   height: MediaQuery.of(context).size.height * 0.6,
    //   // child: SingleChildScrollView(
    //   child: 
      return transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet!!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/fonts/images/snooze.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8, 
                    horizontal: 6
                    ),
                    elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title ,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete), 
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
    //This part strts from the return part
                //Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           //  tx.amount.toString(),
                //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 15,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               transactions[index].title,
                //               style: Theme.of(context).textTheme.headline6,
                //               // TextStyle(
                //               //   fontSize: 16,
                //               //   fontWeight: FontWeight.bold,
                //               // ),
                //             ),
                //             Text(
                //               DateFormat.yMMMd()
                //                   .format(transactions[index].date),
                //               style: TextStyle(color: Colors.grey),
                //             ),
                //           ])
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            );
      // ),
  }
}



