import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserProfile extends Equatable {
  final String id;
  final String name;
  final String image;
  final String email;

  UserProfile({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.email,
  });

  @override
  List<Object> get props => [id, name, image, email];
}
