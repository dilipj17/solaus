import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/entities/result.dart';
import 'package:solaus/domain/repositories/result_repository.dart';

class GetResults implements UseCase<Result, Params> {
  final ResultRepository repository;

  GetResults(this.repository);

  @override
  Future<Either<Failure, Result>> call(Params params) async {
    return await repository.getResult(params.id);
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
