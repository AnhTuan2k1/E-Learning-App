import 'dart:async';

import 'package:e_learning/dialogs/change_question_dialog.dart';
import 'package:e_learning/dialogs/result_exam_dialog.dart';
import 'package:e_learning/dialogs/submit_exam_dialog.dart';
import 'package:e_learning/models/exam_questions.dart';
import 'package:flutter/material.dart';

import '../../dialogs/stop_exam_dialog.dart';
import '../../models/question.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({required this.examQuestion, Key? key}) : super(key: key);
  final ExamQuestion examQuestion;

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final PageController controller = PageController();
  Duration duration = Duration(minutes: 50);
  Timer? timer;
  bool built = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Widget w = WillPopScope(
      onWillPop: () => buildStopExamDialog(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.examQuestion.id),
            actions: [
              IconButton(onPressed: () => _buildChangeQuestionDialog(widget.examQuestion.questions),
                  alignment: Alignment.centerRight,
                  icon: Icon(Icons.apps_outlined, size: 40,)),
              IconButton(
                  onPressed: () => controller.previousPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceInOut),
                  icon: Icon(Icons.keyboard_arrow_left)),
              IconButton(
                  onPressed: () => controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOutQuart),
                  icon: Icon(Icons.keyboard_arrow_right))
            ],
          ),
          body: Container(
            color: Colors.white,
            child: Column(children: [
              buildStateExamPage(),
              Expanded(
                child: PageView(
                    controller: controller,
                    children: widget.examQuestion.questions
                        .map(
                          (e) => SingleChildScrollView(
                        child: Column(children: buildColumn(e)),
                      ),
                    )
                        .toList()),
              ),
            ]),
          )),
    );

    built = true;
    return w;
  }

  Stack buildStateExamPage() {
    if(widget.examQuestion.submited){
      return Stack(children: [
        Align(alignment: Alignment.bottomLeft, child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text('Điểm: ${widget.examQuestion.mark.toString()}',
              style: TextStyle(fontSize: 30)))
        ),
        //Align(alignment: Alignment.center, child: buildTime()),
        Align(alignment: Alignment.centerRight,
            child: ElevatedButton(onPressed: () => {},
              child: Text('đã nộp'),)
        )
      ]);
    }
    else {
      return Stack(children: [
        Align(alignment: Alignment.center, child: buildTime()),
        Align(alignment: Alignment.centerRight,
            child: ElevatedButton(onPressed: () => handleSubmittingExam(),
              child: Text('Nộp bài'),)
        )
      ]);
    }
  }

  Future<bool> buildStopExamDialog() async {
    if(widget.examQuestion.submited) return Future.value(true);
    final value = await showDialog<bool>(
        context: context,
        builder: (context) {
          return const AlertStopExamDialog();
        });
    if (value != null)
      return Future.value(value);
    else
      return Future.value(false);
  }

  Future _buildChangeQuestionDialog(List<Question> questions) async {
    final value = await showDialog<int>(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ChangeQuestionDialog(questions: questions, submited: widget.examQuestion.submited);
        }).then((value) => {
      controller.jumpToPage(value ?? 0)
    });
  }

  handleSubmittingExam() async{
    await showDialog<bool>(
        context: context,
        builder: (context) {
          return const SubmitExamDialog();
        }).then((value) => {
      if(value != null){
        if(value) {
          setState(() {
             widget.examQuestion.makeMark();
          })
        }
      }
    });
  }

  Widget buildTime(){
    //if(widget.examQuestion.submited) return Text('');
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$minutes:$seconds',
      style: TextStyle(fontSize: 40),
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_)=> subtractTime());
  }

  subtractTime() {
    final subtractSeconds = -1;
    if(!mounted) return;
    setState(() {
      final seconds = duration.inSeconds + subtractSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  buildColumn(Question question) {
    List<Widget> list = <Widget>[];
    list.add(Card(
        elevation: 0.5,
        color: Colors.white,
        child: ListTile(
          title: Text(question.question),
        )));

    if (question.image != null) list.add(Image.network(question.image!));

    list.addAll((question.answers.map(
      (e) => Card(
        elevation: 0.5,
          color: getColor(question, e.identifier),
          child: ListTile(
            title: Text('${e.identifier}. ${e.answer}'),
            trailing: ShowAnswer(question, e.identifier),
            onTap: () {
              if(!widget.examQuestion.submited){
                setState(() {
                  question.selectedAnswer = e.identifier;
                });
              }
            },
          )),
    )));

    if(widget.examQuestion.submited){
      if(built){
        if(controller.page != null) {
          list.add(ShowSolutionQuestion(controller.page!.toInt()));
        }
      }
    }

    return list;
  }

  getColor(Question question, identifier) {
    if (question.selectedAnswer == null) {
      return Colors.white;
    } else if (question.selectedAnswer == identifier) {
      return Colors.lightBlue[100];
    } else {
      return Colors.white;
    }
  }

  ShowAnswer(Question question, String identifier) {
    if(widget.examQuestion.submited){
      if(question.correctAnswer == identifier)
        return Icon(Icons.check_circle, color: Colors.green);
      else return Icon(Icons.dangerous, color: Colors.red);
    }
  }

  Widget ShowSolutionQuestion(int? index) {
    if(index != null){
      if(widget.examQuestion.questions[index].solution != null) {
        Widget widg = Text('');
        if (widget.examQuestion.questions[index].solutionImage != null)
          widg = Image.network(widget.examQuestion.questions[index].solutionImage!);
        return Container(
          padding: const EdgeInsets.fromLTRB(15,15,15,15),
          child: Column(
            children: [
              const Text("Lời Giải: ", style: TextStyle(fontSize: 17, color: Colors.black), ),
              widg,
              Stack(
                  children:[
                    Align(
                      alignment: Alignment.topLeft,
                        child: Text(widget.examQuestion.questions[index].solution!))
                  ]),
            ],
          ),
        );
      }
      else return Text('');
    }
    else return Text('');
  }

}

