import 'package:dartz/dartz.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/domain/entities/result.dart';

abstract class ResultRepository {
  Future<Either<Failure, Result>> getResult(String id);
}
