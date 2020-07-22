import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:solaus/domain/entities/books.dart';

@immutable
abstract class BooksState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends BooksState {}

class Loading extends BooksState {}

class Loaded extends BooksState {
  final Books books;

  Loaded({@required this.books});

  @override
  List<Object> get props => [books];
}

class Error extends BooksState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
