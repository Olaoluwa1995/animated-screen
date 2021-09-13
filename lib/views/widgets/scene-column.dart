import 'package:flutter/material.dart';

class SceneColumn extends StatelessWidget {
  const SceneColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: 70,
      height: 160,
      child: OverflowBox(
        maxWidth: 150,
        child: Column(
          children: children
        ),
      ),
    );
  }
}