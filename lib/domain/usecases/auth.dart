import 'package:dartz/dartz.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/success.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/repositories/auth_repository.dart';

class SignInWithGoogle implements UseCase<Success, NoParams> {
  final SignInWithGoogleRepository repository;

  SignInWithGoogle(this.repository);

  @override
  Future<Either<Failure, Success>> call(NoParams params) async {
    return await repository.signInWithGoogle();
  }
}
