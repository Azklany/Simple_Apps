class Questions {
  Questions({required this.question, required this.answers});

  final String question;
  final List answers;
}

List questions = [
  Questions(question: "1+1", answers: ['7', '2', '3', '4']),
  Questions(question: "5+1", answers: ['1', '6', '9', '2']),
  Questions(question: "1+9", answers: ['3', '2', '5', '10']),
  Questions(question: "2+1", answers: ['3', '7', '4', '0']),
];
