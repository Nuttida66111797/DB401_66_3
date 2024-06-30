import 'package:flutter/material.dart';
import 'package:tictactoe/pages/challenge.dart';
import 'package:tictactoe/pages/login.dart';
import 'package:tictactoe/pages/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login':(context) => const Login(),
        'register':(context) => const Register(),
        'challenge':(context) => const Challenge(),
      },
      initialRoute: 'login',  
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor:Colors.lightBlueAccent,
          foregroundColor:Colors.white
        ),
        filledButtonTheme: FilledButtonThemeData(
         style: FilledButton.styleFrom(
          backgroundColor: Colors.blue
        ),
        )
      ),
    );
  }
}
