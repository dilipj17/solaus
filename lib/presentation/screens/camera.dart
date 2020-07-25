import 'dart:async';
import 'dart:io';

import 'package:ant_icons/ant_icons.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:solaus/presentation/screens/calculator.dart';
import 'package:solaus/presentation/screens/history.dart';
import 'package:solaus/presentation/screens/results.dart';
import 'package:solaus/presentation/screens/user_profile.dart';
import 'package:solaus/presentation/widgets/calculator.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key key,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  Future<void> _initializeControllerFuture;
  CameraController _controller;
  int _currentIndex = 0;
  final List<Widget> _children = [
    null,
    HistoryPage(),
    UserProfilePage(),
    CalculatorPage(),
  ];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: _currentIndex == 0
          ? FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return Stack(
                    children: <Widget>[
                      CameraPreview(_controller),
                      Align(
                        alignment: Alignment(0.0, 0.9),
                        child: IconButton(
                          iconSize: 60.0,
                          color: Colors.amber,
                          icon: Icon(Icons.camera),
                          onPressed: () async {
                            // Take the Picture in a try / catch block. If anything goes wrong,
                            // catch the error.
                            try {
                              // Ensure that the camera is initialized.
                              await _initializeControllerFuture;

                              // Construct the path where the image should be saved using the
                              // pattern package.
                              final path = join(
                                // Store the picture in the temp directory.
                                // Find the temp directory using the `path_provider` plugin.
                                (await getTemporaryDirectory()).path,
                                '${DateTime.now()}.png',
                              );

                              // Attempt to take a picture and log where it's been saved.
                              await _controller.takePicture(path);

                              // If the picture was taken, display it on a new screen.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ResultPage(idString: path),
                                ),
                              );
                            } catch (e) {
                              // If an error occurs, log the error to the console.
                              print(e);
                            }
                          },
                        ),
                      )
                    ],
                  );
                } else {
                  return Stack(
                    children: <Widget>[
                      Center(child: CircularProgressIndicator()),
                      Align(
                        alignment: Alignment(0.0, 0.9),
                        child: IconButton(
                          iconSize: 60.0,
                          color: Colors.amber,
                          icon: Icon(Icons.camera),
                          onPressed: () async {
                            // Take the Picture in a try / catch block. If anything goes wrong,
                            // catch the error.
                            try {
                              // Ensure that the camera is initialized.
                              await _initializeControllerFuture;

                              // Construct the path where the image should be saved using the
                              // pattern package.
                              final path = join(
                                // Store the picture in the temp directory.
                                // Find the temp directory using the `path_provider` plugin.
                                (await getTemporaryDirectory()).path,
                                '${DateTime.now()}.png',
                              );

                              // Attempt to take a picture and log where it's been saved.
                              await _controller.takePicture(path);

                              // If the picture was taken, display it on a new screen.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ResultPage(idString: path),
                                ),
                              );
                            } catch (e) {
                              // If an error occurs, log the error to the console.
                              print(e);
                            }
                          },
                        ),
                      )
                    ],
                  );
                  // Otherwise, display a loading indicator.
                }
              },
            )
          : _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.yellow,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.camera),
            title: Text('camera'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            title: Text('books'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(AntIcons.user),
            title: Text('user'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(AntIcons.calculator),
            title: Text('calculator'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
