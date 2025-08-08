import 'package:flutter/material.dart';

class IntroClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 40);
    path.quadraticBezierTo(size.width / 2, -40, 0, 40);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
