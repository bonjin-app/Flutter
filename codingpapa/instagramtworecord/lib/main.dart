import 'package:flutter/material.dart';
import 'package:instagramtworecord/constants/material_white.dart';

import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: HomePage(),
    );
  }
}

