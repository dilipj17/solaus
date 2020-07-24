import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solaus/core/exeptions.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/network_info.dart';
import 'package:solaus/core/success.dart';
import 'package:solaus/data/remote_data_source.dart';
import 'package:solaus/domain/repositories/auth_repository.dart';

class SignInWithGoogleRepositoryImpl implements SignInWithGoogleRepository {
  final SolausRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final GoogleSignIn googleSignIn;

  SignInWithGoogleRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
    @required this.googleSignIn,
  });

  @override
  Future<Either<AuthFailure, Success>> signInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return left(AuthFailure());
      }
      final googleAuthentication = await googleUser.authentication;
      final authCredential = {
        "accessToken": googleAuthentication.accessToken,
        "idToken": googleAuthentication.idToken,
      };
      print(authCredential);
      return Right(Success());
    } on ServerException {
      return Left(AuthFailure());
    }
  }
}
