import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:solaus/domain/entities/books.dart';
import 'package:solaus/domain/entities/history.dart';
import 'package:solaus/domain/entities/result.dart';
import 'package:solaus/domain/entities/user_profile.dart';

@immutable
abstract class SolausState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends SolausState {}

class Loading extends SolausState {}

class AuthSuccessful extends SolausState {}

class AuthDenied extends SolausState {}

class BooksLoaded extends SolausState {
  final Books books;

  BooksLoaded({@required this.books});

  @override
  List<Object> get props => [books];
}

class HistoryLoaded extends SolausState {
  final History history;

  HistoryLoaded({@required this.history});

  @override
  List<Object> get props => [history];
}

class UserProfileLoaded extends SolausState {
  final UserProfile userprofile;

  UserProfileLoaded({@required this.userprofile});

  @override
  List<Object> get props => [userprofile];
}

class ResultLoaded extends SolausState {
  final Result result;

  ResultLoaded({@required this.result});

  @override
  List<Object> get props => [result];
}

class Error extends SolausState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
