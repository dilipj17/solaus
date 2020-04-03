import 'package:flutter/material.dart';
import 'package:solaus/domain/entities/history.dart';

class HistoryModel extends History {
  HistoryModel({
    @required String id,
    @required String equation,
  }) : super(
          id: id,
          equation: equation,
        );
  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'],
      equation: json['equation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'equation': equation,
    };
  }
}
