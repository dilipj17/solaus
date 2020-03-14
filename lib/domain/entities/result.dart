import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserProfile extends Equatable {
  final String id;
  final String user;
  final String equation;
  final String steps;

  UserProfile({
    @required this.id,
    @required this.user,
    @required this.equation,
    @required this.steps,
  });

  @override
  List<Object> get props => [id, user, equation, steps];
}
