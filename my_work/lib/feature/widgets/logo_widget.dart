// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    required this.imagePath,
    this.color,
    this.height,
  }) : super(key: key);
  final String imagePath;
  final Color? color;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: height ?? 60,
      color: color,
    );
  }
}
