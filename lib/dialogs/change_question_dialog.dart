import 'package:e_learning/models/question.dart';
import 'package:flutter/material.dart';

class ChangeQuestionDialog extends StatelessWidget {
  const ChangeQuestionDialog({
    required this.questions,
    Key? key,
  }) : super(key: key);

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.fromLTRB(30, 100, 30, 100),
            color: Colors.white,
            child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 5,
                children: createList(context, questions))));
  }

  List<Container> createList(
      BuildContext context, List<Question> questions) {
    List<Container> list = <Container>[];
    for (int i = 0; i < questions.length; i++) {
      list.add(Container(
        color: getColors(questions[i]),
        child: OutlinedButton(
            onPressed: () => {Navigator.of(context).pop(i)},
            child: Text('${i + 1}', style: TextStyle(fontSize: 20),)),
      ));
    }

    return list;
  }

  getColors(Question question) {
    if(question.selectedAnswer != null)
      return Colors.lightBlue[100];
  }
}
