import 'package:flutter/material.dart';

import '../constants.dart';

class AppCard extends StatelessWidget {
  final BorderSide? borderSide;
  final double height;
  final double width;
  final Column child;
  const AppCard({
    Key? key,
    required this.child,
    this.borderSide,
    this.height = 190,
    this.width = 180,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: borderSide ?? BorderSide.none),
        color: ktranparentColor,
        child: child,
      ),
    );
  }
}
