import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:solaus/data/models/result_model.dart';
import 'package:solaus/domain/entities/result.dart';

import '../../fixture/fixture_reader.dart';

void main() {
  final tResultModel = ResultModel(
    equation: "equation",
    id: "id",
    latex: "user",
    steps: "steps",
  );

  test('should be a subclass of result entity', () async {
    expect(tResultModel, isA<Result>());
  });

  group('fromJson', () {
    test('should return a valid model ', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('result_data.json'));
      final result = ResultModel.fromJson(jsonMap);
      expect(result, tResultModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map contaning the proper data', () {
      final result = tResultModel.toJson();
      final expectedMap = {
        "id": "id",
        "equation": "equation",
        "user": "user",
        "steps": "steps",
      };
      expect(result, expectedMap);
    });
  });
}
