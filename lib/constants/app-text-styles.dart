import 'package:animated_screen/constants/app-colors.dart';
import 'package:flutter/material.dart';

/// App Colors Class - Resource class for storing app level color constants
class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: Colors.white
  );


  static const TextStyle coloredHeading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.PRIMARY_COLOR
  );

  static const TextStyle coloredText = TextStyle(
    color: Colors.orangeAccent,
    fontSize: 15,
    fontWeight: FontWeight.w600
  );

  static const TextStyle coloredTitleText = TextStyle(
    color: Colors.yellow,
    fontSize: 20,
    fontWeight: FontWeight.w800
  );
}