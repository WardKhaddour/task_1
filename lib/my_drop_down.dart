import 'package:flutter/material.dart';
import 'constants.dart';

class MyDropDown extends StatefulWidget {
  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String firstValue = 'Ward';
  @override
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
      ],
    );
  }
}
