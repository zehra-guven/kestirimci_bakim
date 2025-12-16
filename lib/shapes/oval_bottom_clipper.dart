// OvalBottomClipper - Meteor Ailem uyumlu
import 'package:flutter/material.dart';

class OvalBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);

    // Daha yumuşak, modern oval
    path.cubicTo(
      size.width * 0.25, size.height * 1.05,
      size.width * 0.75, size.height * 0.55,
      size.width, size.height * 0.8,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}