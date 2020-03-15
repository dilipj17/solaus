import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/entities/user_profile.dart';
import 'package:solaus/domain/repositories/user_profile_repository.dart';

class GetUserProfile implements UseCase<UserProfile, Params> {
  final UserProfileRepository repository;

  GetUserProfile(this.repository);

  @override
  Future<Either<Failure, UserProfile>> call(Params params) async {
    return await repository.getUserProfile(params.id);
  }
}

class Params extends Equatable {
  final String id;
  Params({
    @required this.id,
  });

  @override
  List<Object> get props => [id];
}
