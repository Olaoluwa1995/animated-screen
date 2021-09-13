import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Scene extends StatelessWidget {
  Scene({
    Key? key,
    required this.title,
    required this.color,
    this.textColor,
    required this.icon,
  }) : super(key: key);

  final String title;
  Color? color;
  Color? textColor = Colors.white60;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.4,
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      decoration: BoxDecoration(
       color: color,
       borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon,
           color: textColor,
           height: size.height * 0.04,
          ),
          SizedBox(
           width: size.width * 0.04,
          ),
          Text(title, style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ))
        ],
      )
    );
  }
}