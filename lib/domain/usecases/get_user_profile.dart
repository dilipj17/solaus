import 'package:dartz/dartz.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/entities/user_profile.dart';
import 'package:solaus/domain/repositories/user_profile_repository.dart';
import 'package:solaus/domain/usecases/get_history.dart';

class GetUserProfile implements UseCase<UserProfile, Params> {
  final UserProfileRepository repository;

  GetUserProfile(this.repository);

  @override
  Future<Either<Failure, UserProfile>> call(Params params) async {
    return await repository.getUserProfile(params.id);
  }
}
