import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solaus/presentation/screens/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solaus',
      theme: ThemeData(
          primaryColor: Color(0xFFF3F3F3),
          accentColor: Color(0xFFF27935),
          fontFamily: 'Quicksand'),
      debugShowCheckedModeBanner: false,
      home: AuthModuleClass(),
    );
  }
}
