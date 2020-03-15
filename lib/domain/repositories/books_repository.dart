import 'package:dartz/dartz.dart';
import 'package:solaus/core/failures.dart';
import 'package:solaus/domain/entities/books.dart';

abstract class BookRepository {
  Future<Either<Failure, Books>> getBooks();
}
