import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wardrobe/presentation/FirstPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Wardrobe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage()
    );
  }
}

