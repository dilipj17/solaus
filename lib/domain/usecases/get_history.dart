import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/entities/history.dart';
import 'package:solaus/domain/repositories/history_repositiry.dart';

class GetHistory implements UseCase<History, Params> {
  final HistoryRepository repository;

  GetHistory(this.repository);

  @override
  Future<Either<Failure, History>> call(Params params) async {
    return await repository.getHistory();
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
