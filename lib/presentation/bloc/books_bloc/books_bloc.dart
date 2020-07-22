import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/entities/books.dart';
import 'package:solaus/domain/usecases/get_books.dart';
import 'package:solaus/presentation/bloc/books_bloc/books_event.dart';
import 'package:solaus/presentation/bloc/books_bloc/books_state.dart';

import '../bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooks getBooks;

  BooksBloc({
    @required GetBooks books,
  })  : assert(books != null),
        getBooks = books;

  @override
  BooksState get initialState => Empty();

  @override
  Stream<BooksState> mapEventToState(
    BooksEvent event,
  ) async* {
    yield Loading();
    final failureOrBooks = await getBooks(NoParams());
    yield* _eitherLoadedOrErrorState(failureOrBooks);
  }

  Stream<BooksState> _eitherLoadedOrErrorState(
    Either<Failure, Books> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (books) => Loaded(books: books),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
