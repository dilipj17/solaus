import 'package:flutter/material.dart';
import 'package:solaus/domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel({
    @required String id,
    @required String name,
    @required String image,
    @required String email,
  }) : super(
          id: id,
          name: name,
          image: image,
          email: email,
        );
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
    };
  }
}
