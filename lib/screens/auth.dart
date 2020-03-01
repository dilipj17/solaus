import 'package:flutter/material.dart';
import 'package:ant_icons/ant_icons.dart';

class AuthModuleClass extends StatefulWidget {
  @override
  _AuthModuleClassState createState() => _AuthModuleClassState();
}

class _AuthModuleClassState extends State<AuthModuleClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFFFFFFF),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Center(
                child: Text(
              'Solaus',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold,color: Theme.of(context).accentColor),
            )),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image:AssetImage("img/lighthouse.gif"))
            ),
            child:Image.asset('img/lighthouse.gif',height: 600.0,),
          ),
          Container(
            width: 280.0,
            height:50.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(25.0))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
              Icon(
                AntIcons.google_circle,
                size: 30.0,
                color: Color(0xFFFFFFFF),
              ),
              SizedBox(width:3.0),
              Text(
                'Continue with Google',
                style: TextStyle(fontSize: 22.0, color: Color(0xFFFFFFFF)),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
