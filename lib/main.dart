import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/constant.dart';
import 'package:tictactoe/menu.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Constant.bgColor1,
      systemNavigationBarDividerColor: Constant.bgColor1,
      statusBarColor: Constant.bgColor2.withOpacity(0.7),
      // systemStatusBarContrastEnforced: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Menu(),
    );
  }
}
