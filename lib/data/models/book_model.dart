import 'package:flutter/material.dart';
import 'package:solaus/domain/entities/books.dart';

class BookModel extends Books {
  BookModel({
    @required String id,
    @required String name,
    @required String image,
    @required String author,
    @required String discription,
    @required String link,
  }) : super(
            id: id,
            name: name,
            image: image,
            author: author,
            discription: discription,
            link: link);
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        author: json['author'],
        discription: json['discription'],
        link: json['link']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'author': author,
      'discription': discription,
      'link': link
    };
  }
}
