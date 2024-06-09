import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int shade = 16777215;

  @override
  Widget build(BuildContext context) {
    void changeColor(y) {
      double height = MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top;
      shade = (y / height * 16777215).round();
        //shade = shade -100;
      if (shade < 0) {
          shade = 0;
        } else if (shade > 16777215) {
          shade = 16777215;
        }
    } 

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTapDown: (details) {
              setState(() => changeColor(details.localPosition.dy));
            },
            onVerticalDragUpdate: (details) {
               setState(() => changeColor(details.localPosition.dy));
            },
          )
        ),
        backgroundColor: Color(0xFF000000 + shade),
      )
    );
  }
}