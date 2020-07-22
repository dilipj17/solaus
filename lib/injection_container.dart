import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solaus/data/repositories/books_repository_impl.dart';
import 'package:solaus/data/repositories/result_repository_impl.dart';
import 'package:solaus/data/repositories/user_profile_repository_impl.dart';
import 'package:solaus/domain/repositories/result_repository.dart';
import 'package:solaus/domain/repositories/user_profile_repository.dart';
import 'package:solaus/domain/usecases/get_books.dart';
import 'package:solaus/domain/usecases/get_history.dart';
import 'package:solaus/domain/usecases/get_result.dart';
import 'package:solaus/domain/usecases/get_user_profile.dart';
import 'package:solaus/presentation/bloc/bloc.dart';

import 'core/network_info.dart';
import 'data/remote_data_source.dart';
import 'data/repositories/history_repository_impl.dart';
import 'domain/repositories/books_repository.dart';
import 'domain/repositories/history_repositiry.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => SolausBloc(
      books: sl(),
      history: sl(),
      userprofile: sl(),
      result: sl(),
    ),
  );

  sl.registerLazySingleton(() => GetHistory(sl()));
  sl.registerLazySingleton(() => GetBooks(sl()));
  sl.registerLazySingleton(() => GetUserProfile(sl()));
  sl.registerLazySingleton(() => GetResults(sl()));

  sl.registerLazySingleton<BookRepository>(
    () => BooksRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<HistoryRepository>(
    () => HistoryRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<UserProfileRepository>(
    () => UserProfileRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ResultRepository>(
    () => ResultRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<SolausRemoteDataSource>(
    () => SolausRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
