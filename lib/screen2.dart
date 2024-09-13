// import 'package:app_one/scrren1.dart';
import 'package:app_one/home.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) {
    // void selectScreen(BuildContext ctx) {
    //   Navigator.of(ctx).pushReplacement(MaterialPageRoute(
    //     builder: (_) {
    //       return const Screen1();
    //     },
    //   ));
    // }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Screen 2"),
      //   backgroundColor: Colors.amber,
      // ),
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return const MyHomePage();
              }));
            },
            child: const Text("Restart Quiz")),
      ),
    );
  }
}
