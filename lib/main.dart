import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/views/home.dart';
// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.windows;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khabar Brief',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
  //
}
//hello this is sudarshan
//
