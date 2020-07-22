import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:solaus/domain/entities/books.dart';

@immutable
abstract class SolausState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends SolausState {}

class Loading extends SolausState {}

class BooksLoaded extends SolausState {
  final Books books;

  BooksLoaded({@required this.books});

  @override
  List<Object> get props => [books];
}

class Error extends SolausState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
