import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Result extends Equatable {
  final String id;
  final String answer;
  final String equation;
  final String steps;
  final String latex;

  Result({
    @required this.id,
    @required this.answer,
    @required this.latex,
    @required this.equation,
    @required this.steps,
  });

  @override
  List<Object> get props => [id, answer, equation, steps, latex];
}
