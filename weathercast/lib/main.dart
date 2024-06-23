import 'package:flutter/material.dart';
import 'report.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Container(
         constraints: const BoxConstraints.expand(),
         decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cloud.gif'),
            fit: BoxFit.cover
            )
         ),
         child: const Report(),
        ),
        ),
        theme: ThemeData(
          textTheme: const TextTheme(
           headlineLarge: TextStyle(
             fontSize: 32,
             color: Colors.white
           ),
           displayLarge: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
          labelMedium: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
            color: Colors.yellow,
          )
        ),
        filledButtonTheme: FilledButtonThemeData(
           style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blueAccent.shade700),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
               )
            )
         ),
    );

  }
}
