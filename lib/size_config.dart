import 'package:flutter/cupertino.dart';

class Sizeconfig {
  static MediaQueryData _mediaquery;
  static double screenHeight;
  static double screenWidth;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaquery = MediaQuery.of(context);
    screenHeight = _mediaquery.size.height;
    screenWidth = _mediaquery.size.width;
    orientation = _mediaquery.orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}
