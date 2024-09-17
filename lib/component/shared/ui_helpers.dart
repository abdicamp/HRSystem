import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// Horizontal Spacing
Widget horizontalSpace(double size) => SizedBox(width: size);

// Vertical Spacing
Widget verticalSpace(double size) => SizedBox(height: size);

// Screen Size helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;

final loadingSpin = const SpinKitFadingCircle(
  color: Color.fromARGB(255, 201, 229, 253),
  size: 46.0,
);
