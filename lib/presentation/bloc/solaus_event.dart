import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SolausEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBooksForApp extends SolausEvent {}
