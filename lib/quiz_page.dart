

import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,20,0,0),
          child: MyList(),
        )
    );
  }
}

class MyList extends StatelessWidget {
  MyList({Key? key}) : super(key: key);
  final List<String> entries = <String>['A', 'B', 'C','A', 'B', 'C','A', 'B', 'C','A', 'B', 'C'];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('Entry ${entries[index]}'),
            onTap: ()  {
            },
          )
        );
      },
    );
  }
}
