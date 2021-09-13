import 'package:animated_screen/models/lights.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LightListContainer extends StatelessWidget {
  const LightListContainer({
    Key? key,
    required Animation delayedAnimation,
  }) : _delayedAnimation = delayedAnimation, super(key: key);
  final Animation _delayedAnimation;

  @override
  Widget build(BuildContext context) {
    final lights = Lights.colorLights;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: size.width * 1 * (1.0 - _delayedAnimation.value.toDouble())),
      width: size.width * 0.95,
      height: size.height * 0.08,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: lights.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: size.height * 0.05,
            width: size.width * 0.36,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
            color: lights[index].bgColor,
            borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(lights[index].icon,
                color: lights[index].color,
                height: size.height * 0.04,
                ),
                SizedBox(
                width: size.width * 0.02,
                ),
                Text(lights[index].text, style: TextStyle(
                  color: lights[index].color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ))
              ],
            )
          );
        },
      ),
    );
  }
}