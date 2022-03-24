

import 'package:e_learning/models/answer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question{
  String question;
  List<Answer> answers;
  String correctAnswer;
  String? selectedAnswer;

  @JsonKey(defaultValue: null)
  String? image;

  @JsonKey(defaultValue: null)
  String? solution;


  Question(this.question, this.answers, this.correctAnswer, this.image,
      this.solution);

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

}