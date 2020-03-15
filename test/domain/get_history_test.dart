import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:solaus/domain/entities/history.dart';
import 'package:solaus/domain/repositories/history_repositiry.dart';
import 'package:solaus/domain/usecases/get_history.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  MockHistoryRepository mockHistoryRepository;
  GetHistory usecase;

  setUp(() {
    mockHistoryRepository = MockHistoryRepository();
    usecase = GetHistory(mockHistoryRepository);
  });
  final tid = 'asd';
  final tHistory = History(id: tid, equation: '3x+2=5');

  test(
    'should get history for the given id from the book repository',
    () async {
      //arrange
      when(mockHistoryRepository.getHistory(any))
          .thenAnswer((_) async => Right(tHistory));
      //act
      final result = await usecase(Params(id: tid));
      //assert
      expect(result, Right(tHistory));
      verify(mockHistoryRepository.getHistory(tid));
      verifyNoMoreInteractions(mockHistoryRepository);
    },
  );
}
