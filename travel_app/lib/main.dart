import 'package:flutter/material.dart';

import 'export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App UI Template',
      theme: ThemeData(
          fontFamily: 'Nunito',
          primarySwatch: Colors.blue,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent),
      home: HomeScreen(),
    );
  }
}
