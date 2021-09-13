import 'package:animated_screen/constants/app-text-styles.dart';
import 'package:flutter/material.dart';

class Feature extends StatelessWidget {
  const Feature({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.coloredHeading),
          SizedBox(
            height: size.height * 0.01,
          ),
          body
        ],
      ),
    );
  }
}
