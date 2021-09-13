import 'package:animated_screen/constants/app-colors.dart';
import 'package:flutter/material.dart';

class Light {
  final int id;
  final Color bgColor;
  final Color color;
  final String text;
  final String icon;

  Light({
    required this.id,
    required this.color,
    required this.text,
    required this.bgColor,
    required this.icon,
  });
}

class Lights {
  static List<Light> colorLights = [
    Light(
      id: 1,
      bgColor: Colors.white,
      text: 'Main Light',
      color: AppColors.NAVY_BLUE_COLOR,
      icon: 'assets/surface1.svg'
    ),
    Light(
      id: 2,
      color: Colors.white,
      text: 'Desks Light',
      bgColor: AppColors.NAVY_BLUE_COLOR,
      icon: 'assets/surface2.svg'
    ),
    Light(
      id: 3,
      bgColor: Colors.white,
      text: 'Bed Light',
      color: AppColors.NAVY_BLUE_COLOR,
      icon: 'assets/bed1.svg'
    ),
    
  ];
}