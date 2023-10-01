import 'package:flutter/material.dart';
import 'home.dart';
import 'resualt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      debugShowCheckedModeBanner: false,
      title: 'flutter Demo',
      home: Home(),
    );
  }
}
