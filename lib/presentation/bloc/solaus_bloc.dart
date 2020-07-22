import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/entities/books.dart';
import 'package:solaus/domain/entities/history.dart';
import 'package:solaus/domain/entities/result.dart';
import 'package:solaus/domain/entities/user_profile.dart';
import 'package:solaus/domain/usecases/get_books.dart';
import 'package:solaus/domain/usecases/get_history.dart';
import 'package:solaus/domain/usecases/get_result.dart';
import 'package:solaus/domain/usecases/get_user_profile.dart';
import 'package:solaus/presentation/bloc/soalus_state.dart';
import 'package:solaus/presentation/bloc/solaus_event.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class SolausBloc extends Bloc<SolausEvent, SolausState> {
  final GetBooks getBooks;
  final GetHistory getHistory;
  final GetUserProfile getUserProfile;
  final GetResults getResults;

  SolausBloc({
    @required GetBooks books,
    @required GetHistory history,
    @required GetUserProfile userprofile,
    @required GetResults result,
  })  : assert(books != null),
        assert(history != null),
        assert(userprofile != null),
        assert(result != null),
        getBooks = books,
        getHistory = history,
        getUserProfile = userprofile,
        getResults = result;

  @override
  SolausState get initialState => Empty();

  @override
  Stream<SolausState> mapEventToState(
    SolausEvent event,
  ) async* {
    if (event is GetBooksForApp) {
      yield Loading();
      final failureOrBooks = await getBooks(NoParams());
      yield* _eitherLoadedOrErrorStateBooks(failureOrBooks);
    } else if (event is GetHistoryForApp) {
      yield Loading();
      final failureOrHistory = await getHistory(Params(id: event.idstring));
      yield* _eitherLoadedOrErrorStateHistory(failureOrHistory);
    } else if (event is GetUserProfileForApp) {
      yield Loading();
      final failureOrUserProfile =
          await getUserProfile(Params(id: event.idstring));
      yield* _eitherLoadedOrErrorStateUserProfile(failureOrUserProfile);
    } else if (event is GetResultsForApp) {
      yield Loading();
      final failureOrResults = await getResults(Params(id: event.idstring));
      yield* _eitherLoadedOrErrorStateResults(failureOrResults);
    }
  }

  Stream<SolausState> _eitherLoadedOrErrorStateBooks(
    Either<Failure, Books> failureOrBooks,
  ) async* {
    yield failureOrBooks.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (books) => BooksLoaded(books: books),
    );
  }

  Stream<SolausState> _eitherLoadedOrErrorStateHistory(
    Either<Failure, History> failureOrHistory,
  ) async* {
    yield failureOrHistory.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (history) => HistoryLoaded(history: history),
    );
  }

  Stream<SolausState> _eitherLoadedOrErrorStateUserProfile(
    Either<Failure, UserProfile> failureOrHistory,
  ) async* {
    yield failureOrHistory.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (userprofile) => UserProfileLoaded(userprofile: userprofile),
    );
  }

  Stream<SolausState> _eitherLoadedOrErrorStateResults(
    Either<Failure, Result> failureOrHistory,
  ) async* {
    yield failureOrHistory.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (result) => ResultLoaded(result: result),
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
