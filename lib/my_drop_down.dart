import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_2/alert_screen.dart';
import 'constants.dart';

class MyDropDown extends StatefulWidget {
  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: DropdownButton(
            value: firstValue,
            items: names.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: kTextStyle,
                ),
              );
            }).toList(),
            style: kTextStyle,
            icon: Icon(
              Icons.arrow_downward,
              color: Colors.black,
            ),
            underline: Container(
              height: 2.0,
              color: Colors.purple,
            ),
            iconSize: 30.0,
            onChanged: (String newValue) {
              setState(() {
                firstValue = newValue;
                // Alert(
                //   context: context,
                //   title: firstValue,
                //   desc: 'You chosed the name $firstValue',
                // ).show();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlertScreen(
                      title: firstValue,
                      description: 'You chosed the name $firstValue',
                    ),
                  ),
                );
              });
            },
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Text(
          firstValue,
          style: kShownTextStyle,
        ),
        SizedBox(
          height: 300,
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
