import 'package:cryptocurrency/dependency_injection.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() async {
  Injector.configure(Flavour.PROD);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.blue[400]
              : null),
      home: new HomePage(),
    );
  }
}
