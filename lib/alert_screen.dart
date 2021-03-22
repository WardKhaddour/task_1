import 'dart:async';

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
  String colon = ':';
  String sec, min, hours;
  int secInt;

  @override
  void initState() {
    hours = "${DateTime.now().hour} ";
    min = '${DateTime.now().minute}';
    sec = '${DateTime.now().second}';
    secInt = DateTime.now().second;
    Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: Column(
        children: [
          Center(
            child: Container(
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                hours,
              ),
              Text(':'),
              Text(
                min,
              ),
              Text(colon),
              Text(
                sec,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getTime() {
    setState(() {
      colon = secInt % 2 == 0 ? ':' : ' ';

      hours = '${DateTime.now().hour % 12}';
      min = '${DateTime.now().minute}';
      sec = '${DateTime.now().second}';
      secInt = DateTime.now().second;
    });
  }
}
