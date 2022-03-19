import 'package:e_learning/models/question.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_questions.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamQuestion {
  String id;
  String description;
  List<Question> questions;

  ExamQuestion(this.id, this.description, this.questions);


  factory ExamQuestion.fromJson(Map<String, dynamic> json) => _$ExamQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$ExamQuestionToJson(this);
}