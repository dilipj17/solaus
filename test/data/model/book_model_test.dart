import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:solaus/data/models/book_model.dart';
import 'package:solaus/domain/entities/books.dart';

import '../../fixture/fixture_reader.dart';

void main() {
  final tBookModel = BookModel(
    id: 'id',
    name: 'name',
    image: 'image',
    discription: 'discription',
    author: 'author',
    link: 'link',
  );

  test(
    'should be a subclass of Book entity',
    () async {
      expect(tBookModel, isA<Books>());
    },
  );

  group('fromJson', () {
    test('should return a valid model when the JSON ', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('book_data.json'));
      final result = BookModel.fromJson(jsonMap);
      expect(result, tBookModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      final result = tBookModel.toJson();
      final expectedMap = {
        "id": "id",
        "name": "name",
        "image": "image",
        "author": "author",
        "discription": "discription",
        "link": "link",
      };
      expect(result, expectedMap);
    });
  });
}
