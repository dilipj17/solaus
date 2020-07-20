import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:solaus/core/exeptions.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/network_info.dart';
import 'package:solaus/data/remote_data_source.dart';
import 'package:solaus/domain/entities/books.dart';
import 'package:solaus/domain/repositories/books_repository.dart';

class BooksRepositoryImpl implements BookRepository {
  final SolausRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BooksRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Books>> getBooks() async {
    try {
      final remotebooks = await remoteDataSource.getBooks();
      return Right(remotebooks);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
