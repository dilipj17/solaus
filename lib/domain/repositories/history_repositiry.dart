import 'package:dartz/dartz.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/domain/entities/history.dart';

abstract class HistoryRepository {
  Future<Either<Failure, History>> getHistory();
}
