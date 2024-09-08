import 'package:app_one/home.dart';
import 'package:app_one/screen2.dart';
import 'package:app_one/scrren1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ,
      routes: {
        '/': (ctx) {
          return const HomePage();
        },
        '/x1': (ctx) {
          return const Screen1();
        },
        '/x2': (ctx) {
          return const Screen2();
        },
      },
    );
  }
}
