import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:solaus/core/exeptions.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/network_info.dart';
import 'package:solaus/core/success.dart';
import 'package:solaus/data/remote_data_source.dart';
import 'package:solaus/domain/repositories/auth_repository.dart';

class SignInWithGoogleRepositoryImpl implements SignInWithGoogleRepository {
  final SolausRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SignInWithGoogleRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<AuthFailure, Success>> signInWithGoogle() async {
    try {
      print("SignInWithGoogleRepositoryImpl");
      return Right(Success());
    } on ServerException {
      return Left(AuthFailure());
    }
  }
}
