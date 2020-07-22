import 'package:flutter/material.dart';
import 'package:solaus/domain/entities/user_profile.dart';

class UserProfileDisplay extends StatelessWidget {
  final UserProfile userprofile;

  const UserProfileDisplay({
    Key key,
    @required this.userprofile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            userprofile.id.toString(),
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  userprofile.name,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
