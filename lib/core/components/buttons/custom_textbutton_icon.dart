import 'package:e_commerce/core/utils/navigator.dart';
import 'package:flutter/material.dart';

class CustomTextButtonIcon extends StatelessWidget {
final padding;
final textColor;
final text;
final icon;
final screen;

CustomTextButtonIcon(
      this.padding, this.textColor, this.text, this.icon, this.screen);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton.icon(
          style: TextButton.styleFrom(
            primary: textColor,
          ),
          label: Text(text),
          icon: Icon(icon),
          onPressed: () {
            AppNavigator.normalNavigator(
                context: context,
                finish: false,
                screen: screen);
          }),
    );
  }
}
