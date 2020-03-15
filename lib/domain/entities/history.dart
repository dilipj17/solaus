import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class History extends Equatable {
  final String id;
  final String equation;

  History({
    @required this.id,
    @required this.equation,
  });

  @override
  List<Object> get props => [id, equation];
}
