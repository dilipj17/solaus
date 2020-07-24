import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:solaus/presentation/screens/calculator.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final mainCamera = cameras.first;
  await di.init();
  runApp(MyApp(mainCamera: mainCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription mainCamera;
  MyApp({Key key, @required this.mainCamera}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solaus',
      theme: ThemeData(
          primaryColor: Color(0xFFF3F3F3),
          accentColor: Color(0xFFF27935),
          fontFamily: 'Quicksand'),
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}
