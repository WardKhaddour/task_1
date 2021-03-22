import 'package:flutter/material.dart';
import 'Button.dart';
import 'constants.dart';

class AlertScreen extends StatefulWidget {
  final String title;
  final String description;
  AlertScreen({@required this.description, @required this.title});

  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.title,
                  style: kShownTextStyle,
                ),
                Text(
                  widget.description,
                  style: kTextStyle,
                ),
                Button(
                  textButton: 'Cancel',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
          margin: EdgeInsets.fromLTRB(0, 150, 0, 150),
        ),
      ),
    );
  }
}
