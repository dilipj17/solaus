import 'package:dartz/dartz.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/entities/books.dart';
import 'package:solaus/domain/repositories/books_repository.dart';

class GetBooks implements UseCase<Books, NoParams> {
  final BookRepository repository;

  GetBooks(this.repository);

  @override
  Future<Either<Failure, Books>> call(NoParams params) async {
    return await repository.getBooks();
  }
}
