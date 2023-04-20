import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/start_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Quiz App",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        // appBar: AppBar(title: const Text("Flutter Quiz")),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.green,
                Colors.lightGreen,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: const StartScreen()),
      ),
    );
  }
}
