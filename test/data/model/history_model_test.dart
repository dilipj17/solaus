import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:solaus/data/models/history_model.dart';
import 'package:solaus/domain/entities/history.dart';

import '../../fixture/fixture_reader.dart';

void main() {
  final tHistoryModel = HistoryModel(
    id: 'id',
    equation: 'equation',
  );

  test(
    'should be a subclass of history entity',
    () async {
      expect(tHistoryModel, isA<History>());
    },
  );

  group('fromJson', () {
    test('should return a valid model when the JSON is return', () {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('history_data.json'));
      final result = HistoryModel.fromJson(jsonMap);
      expect(result, tHistoryModel);
    });
  });

  group('toJson', () {
    test('should return a JSON Map containing the proper data', () {
      final result = tHistoryModel.toJson();
      final expectedMap = {
        "id": "id",
        "equation": "equation",
      };
      expect(result, expectedMap);
    });
  });
}
