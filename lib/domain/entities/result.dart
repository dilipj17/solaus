import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Result extends Equatable {
  final String id;
  final String user;
  final String equation;
  final String steps;

  Result({
    @required this.id,
    @required this.user,
    @required this.equation,
    @required this.steps,
  });

  @override
  List<Object> get props => [id, user, equation, steps];
}
