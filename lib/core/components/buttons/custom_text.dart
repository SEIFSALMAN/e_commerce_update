import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final text;
  final size;
  final padding;
final color;
  CustomText(this.text, this.size, this.padding, this.color);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  
}
