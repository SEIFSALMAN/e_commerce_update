import 'package:e_commerce/src/app_colors.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {

final text ;
final icons;
final bool obscure;
final suffixIcon;
final hintText;
final controller;

CustomTextField(
      this.text, this.icons, this.obscure, this.suffixIcon, this.hintText,this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25,7,30,7),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText';
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          labelText: text,
          suffixIcon: suffixIcon,
          icon: Icon(icons),
          labelStyle: TextStyle(
            color: AppColor.kPrimaryColor,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
