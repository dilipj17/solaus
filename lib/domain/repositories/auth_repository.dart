import 'package:dartz/dartz.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/success.dart';

abstract class SignInWithGoogleRepository {
  Future<Either<AuthFailure, Success>> signInWithGoogle();
}
