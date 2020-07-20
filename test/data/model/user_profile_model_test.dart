import 'package:flutter_test/flutter_test.dart';
import 'package:solaus/data/models/user_profile_model.dart';
import 'package:solaus/domain/entities/user_profile.dart';

void main() {
  final tUserProfileModel = UserProfileModel(
    email: "email",
    id: "id",
    name: "name",
    image: "image",
  );

  test('should be a subclass of userproifle entity', () {
    expect(tUserProfileModel, isA<UserProfile>());
  });
}
