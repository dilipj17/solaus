import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:solaus/core/exeptions.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/network_info.dart';
import 'package:solaus/data/remote_data_source.dart';
import 'package:solaus/domain/entities/user_profile.dart';
import 'package:solaus/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final SolausRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserProfileRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserProfile>> getUserProfile(String id) async {
    try {
      final remoteuserprofile = await remoteDataSource.getUserProfile(id);
      return Right(remoteuserprofile);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
