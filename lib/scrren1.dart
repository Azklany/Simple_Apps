import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: InkWell(
          child: const Text("Screen 2"),
          onTap: () {
            Navigator.of(context).pushNamed("/x2");
          },
        ),
      ),
    );
  }
}
