import 'package:flutter/material.dart';
import 'package:solaus/domain/entities/result.dart';

class ResultModel extends Result {
  ResultModel({
    @required String id,
    @required String answer,
    @required String latex,
    @required String equation,
    @required String steps,
  }) : super(
          id: id,
          answer: answer,
          latex: latex,
          equation: equation,
          steps: steps,
        );
  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['equation_id'],
      answer: json['equation_answer'],
      equation: json['equation_expression'],
      steps: json['steps'],
      latex: json['equation_latex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'answer': answer,
      'equation': equation,
      'steps': steps,
      'latex': latex,
    };
  }
}
