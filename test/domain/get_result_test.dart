import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:solaus/domain/entities/result.dart';
import 'package:solaus/domain/repositories/result_repository.dart';
import 'package:solaus/domain/usecases/get_history.dart';
import 'package:solaus/domain/usecases/get_result.dart';

class MockResultRepository extends Mock implements ResultRepository {}

main() {
  MockResultRepository mockResultRepository;
  GetResults usecase;

  setUp(() {
    mockResultRepository = MockResultRepository();
    usecase = GetResults(mockResultRepository);
  });
  final tid = 'asf';
  final tResult = Result(id: tid, user: 'asf', equation: 'afdsd', steps: 'adf');

  test(
      'should return a result for the given image or id from the result directory',
      () async {
    //arrange
    when(mockResultRepository.getResult(any))
        .thenAnswer((_) async => Right(tResult));
    //act
    final result = await usecase(Params(id: tid));
    //assert
    expect(result, Right(tResult));
    verify(mockResultRepository.getResult(tid));
    verifyNoMoreInteractions(mockResultRepository);
  });
}
