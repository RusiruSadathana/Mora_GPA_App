import 'package:flutter/cupertino.dart';

class ScreenSize {
  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getMinimumSize(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (width <= height) {
      return width;
    }
    return height;
  }
}
