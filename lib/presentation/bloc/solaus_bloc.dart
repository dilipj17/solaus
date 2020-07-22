import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/entities/books.dart';
import 'package:solaus/domain/usecases/get_books.dart';
import 'package:solaus/presentation/bloc/soalus_state.dart';
import 'package:solaus/presentation/bloc/solaus_event.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class SolausBloc extends Bloc<SolausEvent, SolausState> {
  final GetBooks getBooks;

  SolausBloc({
    @required GetBooks books,
  })  : assert(books != null),
        getBooks = books;

  @override
  SolausState get initialState => Empty();

  @override
  Stream<SolausState> mapEventToState(
    SolausEvent event,
  ) async* {
    yield Loading();
    final failureOrBooks = await getBooks(NoParams());
    yield* _eitherLoadedOrErrorState(failureOrBooks);
  }

  Stream<SolausState> _eitherLoadedOrErrorState(
    Either<Failure, Books> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (books) => BooksLoaded(books: books),
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
