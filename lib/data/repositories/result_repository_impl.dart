import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:solaus/core/exeptions.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/network_info.dart';
import 'package:solaus/data/remote_data_source.dart';
import 'package:solaus/domain/entities/result.dart';
import 'package:solaus/domain/repositories/result_repository.dart';

class ResultRpositoryImpl implements ResultRepository {
  final SolausRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ResultRpositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Result>> getResult(String id) async {
    try {
      final remoteresult = await remoteDataSource.getResult(id);
      return Right(remoteresult);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
