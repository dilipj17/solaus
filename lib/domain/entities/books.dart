import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Books extends Equatable {
  final String id;
  final String name;
  final Uri image;
  final String author;
  final String discription;
  final Uri link;

  Books({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.author,
    @required this.discription,
    @required this.link,
  });

  @override
  List<Object> get props => [id, name, image, author, discription, link];
}
