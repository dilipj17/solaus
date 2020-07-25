import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:solaus/core/exeptions.dart';
import 'package:solaus/data/models/book_model.dart';
import 'package:solaus/data/models/history_model.dart';
import 'package:solaus/data/models/result_model.dart';
import 'package:solaus/data/models/user_profile_model.dart';

import 'package:http/http.dart' as http;

abstract class SolausRemoteDataSource {
  Future<BookModel> getBooks();
  Future<HistoryModel> getHistory();
  Future<ResultModel> getResult(String id);
  Future<UserProfileModel> getUserProfile(String id);
  Future<Map<String, String>> getToken(Map<String, String> id);
}

class SolausRemoteDataSourceImpl implements SolausRemoteDataSource {
  final http.Client client;
  SolausRemoteDataSourceImpl({@required this.client});

  @override
  Future<BookModel> getBooks() =>
      _getBooksFromUrl("http://demo3459690.mockable.io/kuchh");

  Future<BookModel> _getBooksFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return BookModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<HistoryModel> getHistory() =>
      _getHistoryFromUrl("http://demo3459690.mockable.io/history");

  Future<HistoryModel> _getHistoryFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return HistoryModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResultModel> getResult(String id) =>
      _getResultFromUrl("http://demo3459690.mockable.io/result", id);

  Future<ResultModel> _getResultFromUrl(String url, String id) async {
    Map data = {'image': id};
    String body = json.encode(data);
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      return ResultModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserProfileModel> getUserProfile(String id) =>
      _getUserProfileFromUrl("http://demo3459690.mockable.io/userprofile");

  Future<UserProfileModel> _getUserProfileFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<Map<String, String>> getToken(Map<String, String> id) async {
    final responce = await client.post(
      "asf",
      headers: {
        'Content-Type': 'application/json',
      },
      body: id,
    );

    if (responce.statusCode == 200) {
      return json.decode(responce.body);
    } else {
      throw ServerException();
    }
  }
}
