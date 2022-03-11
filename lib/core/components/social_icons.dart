import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
class SocialIcons extends StatelessWidget {

  static const IconData facebook = IconData(0xe255, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SignInButton(
          Buttons.Facebook,
          mini: true,
          onPressed: () {},
        ),
        SignInButton(
          Buttons.GitHub,
          mini: true,
          onPressed: () {},
        ),
        SignInButton(
          Buttons.Pinterest,
          mini: true,
          onPressed: () {},
        ),
        SignInButton(

          Buttons.Hotmail,
          mini: true,
          onPressed: () {},
        ),
        SignInButton(
          Buttons.Apple,
          mini: true,
          onPressed: () {},
        ),
        SignInButton(
          Buttons.Twitter,
          mini: true,
          onPressed: () {},
        )
      ],
    );
  }
}
