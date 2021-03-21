import 'package:flutter/material.dart';

import 'my_drop_down.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: MyDropDown(),
        ),
      ),
    );
  }
}
