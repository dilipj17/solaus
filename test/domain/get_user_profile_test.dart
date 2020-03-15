import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:solaus/domain/entities/user_profile.dart';
import 'package:solaus/domain/repositories/user_profile_repository.dart';
import 'package:solaus/domain/usecases/get_user_profile.dart';

class MockUserProfileRepository extends Mock implements UserProfileRepository {}

void main() {
  MockUserProfileRepository mockUserProfileRepository;
  GetUserProfile usecase;

  setUp(() {
    mockUserProfileRepository = MockUserProfileRepository();
    usecase = GetUserProfile(mockUserProfileRepository);
  });
  final tid = 'asdf';
  final tUserProfile =
      UserProfile(id: tid, name: 'kuchh', image: 'sdf', email: 'sdf');
  test(
    'should get user profile for the given id from the user profile repository',
    () async {
      //arrange
      when(mockUserProfileRepository.getUserProfile(any))
          .thenAnswer((_) async => Right(tUserProfile));
      //act
      final result = await usecase(Params(id: tid));
      //assert
      expect(result, Right(tUserProfile));
      verify(mockUserProfileRepository.getUserProfile(tid));
      verifyNoMoreInteractions(mockUserProfileRepository);
    },
  );
}
