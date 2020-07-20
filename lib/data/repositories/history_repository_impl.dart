import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:solaus/core/exeptions.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/network_info.dart';
import 'package:solaus/data/remote_data_source.dart';
import 'package:solaus/domain/entities/history.dart';
import 'package:solaus/domain/repositories/history_repositiry.dart';

class HistoryRpositoryImpl implements HistoryRepository {
  final SolausRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HistoryRpositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, History>> getHistory(String id) async {
    try {
      final remotehistory = await remoteDataSource.getHistory(id);
      return Right(remotehistory);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
