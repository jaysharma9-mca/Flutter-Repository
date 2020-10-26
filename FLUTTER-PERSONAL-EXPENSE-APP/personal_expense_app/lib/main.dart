import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();// set the device in portrait mode only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*Platform.isIOS
                                        ? CupertinoApp(
                                        debugShowCheckedModeBanner: false,) :*/ // for iOS
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Personal Expense",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amberAccent,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  bool _showChart = false;

  List<Transaction> get _recentTransactions //to show chart data from chart.dart
  {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _startAtNewTransaction(BuildContext ctx) {
    //show bottom sheet popup
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context); // media query object

    final isLandscape = mediaQuery.orientation ==
        Orientation.landscape; //to check screen orientation

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("Personal Expense"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // for iOS
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () =>
                      _startAtNewTransaction(context), //show bottom sheet popup
                ),
              ],
            ),
          )
        : AppBar(
            title: Text("Personal Expense"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () =>
                    _startAtNewTransaction(context), //show bottom sheet popup
              ),
            ],
          );

    final txListWidget = Container(
        //to show recyclerview -- passes data to transaction_list.dart file
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.65,
        child: TransactionList(_userTransactions, _deleteTransaction));

    final pageBody = SafeArea(
        child: SingleChildScrollView(
      child: Column(
        // aligns items above each other
        // columns default behavior is to align the widgets in center
        // col -- mainaxis alignment is from top to bottom     row -- mainaxis alignment is from left to right
        // col -- crossaxis alignment is from left to right    col -- crossaxis alignment is from top to bottom
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (isLandscape) // to check if phone in landscape mode then to show switch
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Show Chart",
                  style: Theme.of(context)
                      .textTheme
                      .title, // specifically for iOS styling
                ),
                Switch.adaptive(
                  //adaptive is for making switch work on both android and ios
                  activeColor:
                      Theme.of(context).accentColor, // general theme color
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  },
                ),
              ],
            ),

          if (!isLandscape) // to check if phone is not in landscape mode and then to show bar graph and recyclerview
            Container(
                //to show bar graph
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.35,
                child: Chart(_recentTransactions)),

          if (!isLandscape) // to check if phone is not in landscape mode and then to show bar graph and recyclerview
            txListWidget,

          if (isLandscape) // to check if phone is in landscape mode and then to show bar graph and recyclerview based on switch selection
            _showChart
                ? Container(
                    //to show bar graph
                    height: (mediaQuery.size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.8,
                    child: Chart(_recentTransactions))
                : txListWidget
          //to show recyclerview -- passes data to transaction_list.dart file
        ],
      ),
    ));

    //if Platform.isIOS then-->(?) CupertinoPageScaffold() else--> (:) Scaffold(),
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container(
                    //using ? is a ternary oper which is like if and else so it is like
                    //if(Platform.isIOS) Container()
                    //else FloatingActonButto
                    )
                : FloatingActionButton(
                    backgroundColor: Colors.blueAccent[300],
                    child: Icon(Icons.add),
                    onPressed: () => _startAtNewTransaction(context),
                  ),
          );
  }
}
