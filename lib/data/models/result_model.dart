import 'package:flutter/material.dart';
import 'package:solaus/domain/entities/result.dart';

class ResultModel extends Result {
  ResultModel({
    @required String id,
    @required String user,
    @required String equation,
    @required String steps,
  }) : super(
          id: id,
          user: user,
          equation: equation,
          steps: steps,
        );
  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['id'],
      user: json['user'],
      equation: json['equation'],
      steps: json['steps'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'equation': equation,
      'steps': steps,
    };
  }
}
