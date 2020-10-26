import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final activePlayerColor = const Color(0xffe1ecf4);
  final inactivePlayerColor = const Color(0xfff5f6f8);

  bool _visible = false;
  bool _visibleP1 = true;
  bool _visibleP2 = false;
  bool _ignorePointer = false;

  String player1 = "Player 1";
  String player2 = "Player 2";

  int roundScore1 = 0;
  int roundScore2 = 0;
  int totalScore1 = 0;
  int totalScore2 = 0;
  int dice = 0;
  int activePlayer1 = 0;
  int activePlayer2 = 1;

  showAlertDialog(BuildContext context, String message, String heading,
      String buttonAcceptTitle) {
    // set up the buttons
    Widget continueButton = FlatButton(
      child: Text(buttonAcceptTitle),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(heading),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _toggle() {
    setState(() {
      _visible = true;
    });
  }

  void _toggleFalse() {
    setState(() {
      _visible = false;
    });
  }

  void _togglePlayer1() {
    if (dice != 1) {
      _toggle();
      roundScore1 += dice;
    } else {
      dice = 0;
      roundScore1 = 0;
      activePlayer1 = 3;
      activePlayer2 = 1;
      _visibleP1 = false;
      _visibleP2 = true;
      _toggleFalse();
    }
  }

  void _togglePlayer2() {
    if (dice != 1) {
      _toggle();
      roundScore2 += dice;
    } else {
      dice = 0;
      roundScore2 = 0;
      activePlayer2 = 4;
      activePlayer1 = 0;
      _visibleP2 = false;
      _visibleP1 = true;
      _toggleFalse();
    }
  }

  void rollDice() {
    setState(() {
      dice = Random().nextInt(6) + 1;
      if (activePlayer1 == 0) {
        _togglePlayer1();
      } else if (activePlayer2 == 1) {
        _togglePlayer2();
      }
    });
  }

  void holdScore() {
    setState(() {
      if (activePlayer1 == 0) {
        totalScore1 += roundScore1;
        if (totalScore1 >= 100) {
          player1 = "WINNER!!!";
          _visibleP1 = false;
          _ignorePointer = true;
          _toggleFalse();
          showAlertDialog(context, 'Player 1 Winner !!!', "PIG GAME", "OK");
        } else {
          activePlayer1 = 3;
          activePlayer2 = 1;
          _visibleP1 = false;
          _visibleP2 = true;
          roundScore1 = 0;
          _toggleFalse();
        }
      } else if (activePlayer2 == 1) {
        totalScore2 += roundScore2;
        if (totalScore2 >= 100) {
          player2 = "WINNER!!!";
          _visibleP2 = false;
          _ignorePointer = true;
          _toggleFalse();
          showAlertDialog(context, 'Player 2 Winner !!!', "PIG GAME", "OK");
        } else {
          activePlayer2 = 4;
          activePlayer1 = 0;
          _visibleP1 = true;
          _visibleP2 = false;
          roundScore2 = 0;
          _toggleFalse();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: inactivePlayerColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pig Game'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Visibility(
                  child: Container(
                    color: activePlayerColor,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _visibleP1,
                ),
                Visibility(
                  child: Container(
                    color: activePlayerColor,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _visibleP2,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => HomePage(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'NEW GAME',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '$player1',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Visibility(
                            child: Icon(
                              Icons.adjust,
                              color: Colors.red,
                            ),
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: _visibleP1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '$player2',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Visibility(
                            child: Icon(
                              Icons.adjust,
                              color: Colors.red,
                            ),
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: _visibleP2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            child: Center(
                              child: Text(
                                '$totalScore1',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Visibility(
                          child: Image.asset(
                            'images/dice-$dice.png',
                            height: 100,
                            width: 100,
                          ),
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: _visible,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            child: Center(
                              child: Text(
                                '$totalScore2',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: 75,
                          height: 75,
                          color: Colors.red.shade700,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Current',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '$roundScore1',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          IgnorePointer(
                            ignoring: _ignorePointer,
                            child: FlatButton(
                              onPressed: () {
                                rollDice();
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.sync,
                                    color: Colors.red.shade700,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'ROLL DICE',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IgnorePointer(
                            ignoring: _ignorePointer,
                            child: FlatButton(
                              onPressed: () {
                                holdScore();
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.archive,
                                    color: Colors.red.shade700,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'HOLD',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: 75,
                          height: 75,
                          color: Colors.red.shade700,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Current',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '$roundScore2',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
