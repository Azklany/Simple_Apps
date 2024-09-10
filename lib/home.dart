import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';

class MyPageHome extends StatefulWidget {
  const MyPageHome({super.key});

  @override
  State<MyPageHome> createState() => _MyPageHomeState();
}

class _MyPageHomeState extends State<MyPageHome> {
  int selectedPic = 1;
  var random = Random();
  void changePic() {
    setState(() {
      selectedPic = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 212, 149),
      appBar: AppBar(
        title: const Text("Design One"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/dice-$selectedPic.png",
              width: 200,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  changePic();
                  dev.log("Clicked");
                },
                child: const Text("CLick"))
          ],
        ),
      ),
    );
  }
}
