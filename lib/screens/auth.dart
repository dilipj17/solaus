import 'package:flutter/material.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:solaus/screens/homepage.dart';

class AuthModuleClass extends StatefulWidget {
  @override
  _AuthModuleClassState createState() => _AuthModuleClassState();
}

class _AuthModuleClassState extends State<AuthModuleClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: <Widget>[
          Image.asset('img/lighthouse.gif', height: 740.0, fit: BoxFit.fill),
          Align(
            alignment: Alignment(0, -0.8),
            child: Text(
              'Solaus',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.86),
            child: Container(
              width: 280.0,
              height: 50.0,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              child: Material(
                  color: Theme.of(context).accentColor,
                  child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomePage())),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              AntIcons.google_circle,
                              size: 30.0,
                              color: Color(0xFFFFFFFF),
                            ),
                            SizedBox(width: 3.0),
                            Text(
                              'Continue with Google',
                              style: TextStyle(
                                  fontSize: 22.0, color: Color(0xFFFFFFFF)),
                            ),
                          ]))),
            ),
          ),
        ],
      ),
    );
  }
}
