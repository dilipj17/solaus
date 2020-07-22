import 'package:dartz/dartz.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/entities/result.dart';
import 'package:solaus/domain/repositories/result_repository.dart';
import 'package:solaus/domain/usecases/get_history.dart';

class GetResults implements UseCase<Result, Params> {
  final ResultRepository repository;

  GetResults(this.repository);

  @override
  Future<Either<Failure, Result>> call(Params params) async {
    return await repository.getResult(params.id);
  }
}
