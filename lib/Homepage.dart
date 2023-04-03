// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oneTurn = true; //first player is oneTurn
  List<String> displayXO = ["", "", "", "", "", "", "", "", ""];
  int Xscore = 0;
  int Oscore = 0;
  int filledboxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Player O",
                        ),
                        Text(
                          Oscore.toString(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Player X",
                          ),
                          Text(
                            Xscore.toString(),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(66, 28, 15, 15))),
                    child: Center(
                      child: Text(
                        displayXO[index],
                        //
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                  child: Column(
                children: [
                  Text('@Tic Tac Toe'),
                  SizedBox(
                    height: 50,
                  ),
                  Text('@CREATEDBTBIBEKBG'),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (displayXO[index] == '') {
        if (oneTurn) {
          displayXO[index] = 'O';
          filledboxes += 1;
        } else {
          displayXO[index] = 'X';
          filledboxes += 1;
        }

        oneTurn = !oneTurn;
        CheckWinner();
      }
    });
  }

  void CheckWinner() {
    //row
    if (displayXO[0] == displayXO[1] &&
        displayXO[1] == displayXO[2] &&
        displayXO[0] != '') {
      DialoBox(displayXO[0]);
    }

    if (displayXO[3] == displayXO[4] &&
        displayXO[4] == displayXO[5] &&
        displayXO[3] != '') {
      DialoBox(displayXO[3]);
    }

    if (displayXO[6] == displayXO[7] &&
        displayXO[7] == displayXO[8] &&
        displayXO[6] != '') {
      DialoBox(displayXO[6]);
    }
    //col
    if (displayXO[0] == displayXO[3] &&
        displayXO[3] == displayXO[6] &&
        displayXO[0] != '') {
      DialoBox(displayXO[0]);
    }

    if (displayXO[1] == displayXO[4] &&
        displayXO[4] == displayXO[7] &&
        displayXO[1] != '') {
      DialoBox(displayXO[1]);
    }

    if (displayXO[2] == displayXO[5] &&
        displayXO[5] == displayXO[8] &&
        displayXO[2] != '') {
      DialoBox(displayXO[2]);
    }
    //DiGONAL
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      DialoBox(displayXO[0]);
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[4] == displayXO[6] &&
        displayXO[2] != '') {
      DialoBox(displayXO[2]);
    } else if (filledboxes == 9) {
      DrawDialog();
    }
  }

  void DialoBox(String Winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('winner is :' + Winner),
            actions: [
              TextButton(
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again'),
              ),
            ],
          );
        });
    if (Winner == 'O') {
      Oscore = Oscore + 1;
    } else if (Winner == 'X') {
      Xscore += 1;
    }
  }

  void DrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Draw '),
            actions: [
              TextButton(
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again'),
              ),
            ],
          );
        });
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
    filledboxes = 0;
  }
}
