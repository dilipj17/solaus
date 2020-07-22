import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solaus/core/usecase.dart';
import 'package:solaus/domain/entities/books.dart';
import 'package:solaus/domain/repositories/books_repository.dart';
import 'package:solaus/domain/usecases/get_books.dart';

class MockBooksRepository extends Mock implements BookRepository {}

void main() {
  GetBooks usecase;
  MockBooksRepository mockBooksRepository;

  setUp(() {
    mockBooksRepository = MockBooksRepository();
    usecase = GetBooks(mockBooksRepository);
  });
  final tBooks = Books(
    author: 'meef',
    id: 'asfsa',
    name: 'adsf',
    discription: 'asf',
    image: 'asf',
    link: 'asf',
  );

  test(
    'should get list of book from the repository',
    () async {
      // arrange
      when(mockBooksRepository.getBooks())
          .thenAnswer((_) async => Right(tBooks));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(tBooks));
      verify(mockBooksRepository.getBooks());
      verifyNoMoreInteractions(mockBooksRepository);
    },
  );
}
