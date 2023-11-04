// ignore_for_file: prefer_const_constructors, unused_local_variable, camel_case_types, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/constant.dart';
import 'package:tictactoe/menu.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.level});
  final int level;
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<int> board = List<int>.filled(9, 0);
  List<int> winnerList = [];
  int currentPlayer = Constant.human;
  int _winner = 0;
  int playerScore = 0;
  int aiScore = 0;
  bool pause = false;

  @override
  Widget build(BuildContext context) {
    double boardSize = min(
      MediaQuery.of(context).size.height,
      MediaQuery.of(context).size.width,
    );
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "TIC TAC TOE",
          style: TextStyle(
            color: Constant.boardColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              foregroundColor: Constant.boardColor,
            ),
            onPressed: () {
              setState(() {
                pause = !pause;
              });
            },
            child: Icon(Icons.pause),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: Constant.defaultPadding * 0.75,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Constant.bgColor1, Constant.bgColor2],
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/you.svg",
                              width: 100,
                              height: 100,
                              color: Constant.boardColor,
                            ),
                            Text(
                              "You : $playerScore",
                              style: TextStyle(
                                color: Constant.boardColor,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              "assets/ai.svg",
                              width: 90,
                              height: 90,
                              color: Constant.boardColor,
                            ),
                            Text(
                              "Jarvis : $aiScore",
                              style: TextStyle(
                                color: Constant.boardColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(0),
                      height: boardSize,
                      width: boardSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Constant.boardColor,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                boardButton(boardSize, 0),
                                boardButton(boardSize, 1),
                                boardButton(boardSize, 2),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                boardButton(boardSize, 3),
                                boardButton(boardSize, 4),
                                boardButton(boardSize, 5),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                boardButton(boardSize, 6),
                                boardButton(boardSize, 7),
                                boardButton(boardSize, 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constant.boardColor,
                        foregroundColor: Constant.boardColor,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                      ),
                      onPressed: reset,
                      child: SizedBox(
                        height: 50,
                        width: 100,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.restart_alt,
                                color: Constant.bgColor1,
                              ),
                              Text(
                                "Reset",
                                style: TextStyle(
                                  color: Constant.bgColor1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            _winner != 0 || !board.contains(0) || pause
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5),
                      ),
                      child: Center(
                        child: pause
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 200),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Constant.boardColor,
                                      foregroundColor: Constant.boardColor,
                                      shadowColor: Colors.transparent,
                                      surfaceTintColor: Colors.transparent,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        pause = false;
                                      });
                                    },
                                    child: SizedBox(
                                      height: 75,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          "Continue",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Constant.bgColor1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Constant.boardColor,
                                      foregroundColor: Constant.boardColor,
                                      shadowColor: Colors.transparent,
                                      surfaceTintColor: Colors.transparent,
                                    ),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Menu(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: SizedBox(
                                      height: 75,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          "Menu",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Constant.bgColor1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 15),
                                  Text(
                                    _winner > 0
                                        ? "AI WIN"
                                        : _winner == 0
                                            ? "DRAW"
                                            : "YOU WIN",
                                    style: TextStyle(
                                      color: Constant.boardColor,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Constant.boardColor,
                                    ),
                                    onPressed: reset,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.restart_alt,
                                          color: Constant.bgColor1,
                                        ),
                                        Text(
                                          "Play again",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Constant.bgColor1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void reset() {
    board = List<int>.filled(9, 0);
    winnerList = [];
    currentPlayer = Constant.human;
    _winner = 0;
    setState(() {});
  }

  GestureDetector boardButton(double boardSize, int index) {
    return GestureDetector(
      onTap: () {
        if (currentPlayer == Constant.human && board[index] == 0) {
          setState(() {
            board[index] = Constant.human;
            currentPlayer = Constant.ai;
            winner();
            if (_winner == 0) {
              if (widget.level == 1) ai1();
              if (widget.level == 2) ai2();
            }
          });
        }
      },
      child: Container(
        margin: EdgeInsets.all(
          Constant.defaultPadding * 0.4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: winnerList.contains(index)
              ? Color(0xFF24464F)
              : Constant.bgColor1,
        ),
        height: boardSize / 3 - 15,
        width: boardSize / 3 - 15,
        child: Center(
          child: SizedBox(
            height: boardSize * 0.2,
            width: boardSize * 0.2,
            child: board[index] == Constant.human
                ? CustomPaint(
                    painter: XPainter(1),
                  )
                : board[index] == Constant.ai
                    ? CustomPaint(
                        painter: OPainter(1),
                      )
                    : null,
          ),
        ),
      ),
    );
  }

  void ai1() {
    List<int> emptyCase = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i] == 0) emptyCase.add(i);
    }

    Timer(
      Duration(milliseconds: 500),
      () {
        if (emptyCase.isNotEmpty) {
          int choice = Random().nextInt(emptyCase.length);
          board[emptyCase[choice]] = Constant.ai;
          setState(() {});
          currentPlayer = Constant.human;
          setState(() {});
        }
        winner();
      },
    );
  }

  void ai2() {
    var bestScore = double.negativeInfinity;
    var bestMove;
    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) {
        board[i] = Constant.ai;
        var score = minimax(board, false);
        board[i] = 0;
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    if (board.contains(0)) {
      board[bestMove] = Constant.ai;
      currentPlayer = Constant.human;
    }
    winner();
  }

  minimax(List<int> _board, bool isMaximizing) {
    var winner = winnerCheckOnly(_board);
    if (winner != null) {
      return winner.toDouble();
    }

    if (isMaximizing) {
      var bestScore = double.negativeInfinity;
      for (int i = 0; i < 9; i++) {
        if (_board[i] == 0) {
          _board[i] = Constant.ai;
          var score = minimax(_board, false);
          _board[i] = 0;
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      var bestScore = double.infinity;
      for (int i = 0; i < 9; i++) {
        if (_board[i] == 0) {
          _board[i] = Constant.human;
          var score = minimax(_board, true);
          _board[i] = 0;
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  winnerCheckOnly(List<int> _board) {
    var tempWinner;
    // lines
    if (pow((_board[0] + _board[1] + _board[2]), 2) == 9) {
      tempWinner = _board[0];
    } else if (pow((_board[3] + _board[4] + _board[5]), 2) == 9) {
      tempWinner = _board[3];
    } else if (pow((_board[6] + _board[7] + _board[8]), 2) == 9) {
      tempWinner = _board[6];
    }

    // columns
    else if (pow((_board[0] + _board[3] + _board[6]), 2) == 9) {
      tempWinner = _board[0];
    } else if (pow((_board[1] + _board[4] + _board[7]), 2) == 9) {
      tempWinner = _board[1];
    } else if (pow((_board[2] + _board[5] + _board[8]), 2) == 9) {
      tempWinner = _board[2];
    }

    // diagonals
    else if (pow((_board[0] + _board[4] + _board[8]), 2) == 9) {
      tempWinner = _board[0];
    } else if (pow((_board[2] + _board[4] + _board[6]), 2) == 9) {
      tempWinner = _board[2];
    }

    if (tempWinner == Constant.human) {
      return Constant.human;
    } else if (tempWinner == Constant.ai) {
      return Constant.ai;
    } else if (!_board.contains(0)) {
      return 0;
    }
  }

  winner() {
    setState(() {
      // lines
      if (pow((board[0] + board[1] + board[2]), 2) == 9) {
        _winner = board[0];
        winnerList = [0, 1, 2];
        currentPlayer = 0;
      } else if (pow((board[3] + board[4] + board[5]), 2) == 9) {
        _winner = board[3];
        winnerList = [3, 4, 5];
        currentPlayer = 0;
      } else if (pow((board[6] + board[7] + board[8]), 2) == 9) {
        _winner = board[6];
        winnerList = [6, 7, 8];
        currentPlayer = 0;
      }

      // columns
      else if (pow((board[0] + board[3] + board[6]), 2) == 9) {
        _winner = board[0];
        winnerList = [0, 3, 6];
        currentPlayer = 0;
      } else if (pow((board[1] + board[4] + board[7]), 2) == 9) {
        _winner = board[1];
        winnerList = [1, 4, 7];
        currentPlayer = 0;
      } else if (pow((board[2] + board[5] + board[8]), 2) == 9) {
        _winner = board[2];
        winnerList = [2, 5, 8];
        currentPlayer = 0;
      }

      // diagonals
      else if (pow((board[0] + board[4] + board[8]), 2) == 9) {
        _winner = board[0];
        winnerList = [0, 4, 8];
        currentPlayer = 0;
      } else if (pow((board[2] + board[4] + board[6]), 2) == 9) {
        _winner = board[2];
        winnerList = [2, 4, 6];
        currentPlayer = 0;
      }

      //
      if (_winner == Constant.human) {
        playerScore += 1;
        _winner = -100;
      } else if (_winner == Constant.ai) {
        aiScore += 1;
        _winner = 100;
      }
    });
  }
}
