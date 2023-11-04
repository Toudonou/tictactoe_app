// ignore_for_file: prefer_const_constructors, unused_local_variable, camel_case_types, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/constant.dart';
import 'package:tictactoe/game.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
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
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: CustomPaint(
                        painter: XPainter(1),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: CustomPaint(
                        painter: OPainter(1),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: CustomPaint(
                        painter: OPainter(1),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: CustomPaint(
                        painter: XPainter(1),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 70),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Constant.boardColor,
                foregroundColor: Constant.boardColor,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Game(level: 1),
                  ),
                );
              },
              child: SizedBox(
                height: 75,
                width: 150,
                child: Center(
                  child: Text(
                    "Beatable",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Constant.bgColor1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Constant.boardColor,
                foregroundColor: Constant.boardColor,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Game(level: 2),
                  ),
                );
              },
              child: SizedBox(
                height: 75,
                width: 150,
                child: Center(
                  child: Text(
                    "Unbeatable",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Constant.bgColor1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
