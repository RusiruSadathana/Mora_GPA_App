import 'package:flutter/material.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/widgets/circularProgressBar.dart';

class CircularCard extends StatelessWidget {
  final double currentValue;
  final double maxValue;
  final String title;
  CircularCard({this.currentValue, this.maxValue, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 300, maxWidth: 300),
      child: Card(
        color: klightBackgroundColor,
        elevation: 5,
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CircularProgressBar(
            backgroundColor: kbackgroundColor,
            foregroundColor: kPrimaryColor,
            value: currentValue / maxValue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  (currentValue).toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
