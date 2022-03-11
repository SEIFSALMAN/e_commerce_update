import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  final width;
  final function;
  final text;

  CustomElevatedButton(this.width,
      this.function, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          primary: AppColor.kPrimaryColor, // background (button) color
          onPrimary: Colors.white, // foreground (text) color
        ),
        onPressed: function,

        child: Text(text),
      ),
    );
  }
}
