import 'package:app_one/scrren1.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.green],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/OIP.jpeg", width: 200),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return const Screen1();
                  }));
                },
                label: const Text("Start Quiz"),
                icon: const Icon(Icons.arrow_forward),
                style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 85, 169, 88)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
