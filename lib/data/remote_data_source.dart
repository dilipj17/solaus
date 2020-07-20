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
  Future<HistoryModel> getHistory(String id);
  Future<ResultModel> getResult(String id);
  Future<UserProfileModel> getUserProfile(String id);
}

class SolausRemoteDataSourceImpl implements SolausRemoteDataSource {
  final http.Client client;
  SolausRemoteDataSourceImpl({@required this.client});

  @override
  Future<BookModel> getBooks() =>
      _getBooksFromUrl("http://numbersapi.com/random");

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
  Future<HistoryModel> getHistory(String id) => _getHistoryFromUrl("#");

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
  Future<ResultModel> getResult(String id) => _getResultFromUrl("#");

  Future<ResultModel> _getResultFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ResultModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserProfileModel> getUserProfile(String id) =>
      _getUserProfileFromUrl("#");

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
}
