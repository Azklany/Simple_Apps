import 'dart:developer';

import 'package:app_one/data/questions.dart';
import 'package:app_one/screen2.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[index];
    List<String> userAnswers = [];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 113, 127, 139),
            Color.fromARGB(255, 137, 163, 138)
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.question,
                textAlign: TextAlign.center,
              ),
              ...currentQuestion.answers.map((e) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: AnswerButtons(
                      txt: e,
                      onPress: () {
                        log(e);
                        userAnswers.add(e);
                        log(userAnswers.toString());
                        setState(() {
                          index++;
                        });
                        if (index == questions.length) {
                          index = 0;
                          // log(userAnswers.toString());
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (_) {
                            return const Screen2();
                          }));
                        }
                      }),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class AnswerButtons extends StatelessWidget {
  const AnswerButtons({
    super.key,
    required this.txt,
    required this.onPress,
  });
  final String txt;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 162, 155, 135),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Text(txt),
    );
  }
}
