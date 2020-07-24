import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SolausEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBooksForApp extends SolausEvent {}

class LogInWithGooglePressed extends SolausEvent {}

class GetHistoryForApp extends SolausEvent {
  final String idstring;

  GetHistoryForApp({@required this.idstring});

  @override
  List<Object> get props => [idstring];
}

class GetUserProfileForApp extends SolausEvent {
  final String idstring;

  GetUserProfileForApp({@required this.idstring});

  @override
  List<Object> get props => [idstring];
}

class GetResultsForApp extends SolausEvent {
  final String idstring;

  GetResultsForApp({@required this.idstring});

  @override
  List<Object> get props => [idstring];
}
