import 'package:flutter/material.dart';

class AppNavigator {

  static animatedNavigator({context, screen, required bool finish}) {
    finish
        ? Navigator.pushAndRemoveUntil(context,
      PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return ScaleTransition(
              scale: animation,
              child: child,
              alignment: Alignment.center,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return screen;
          }),(route) => false,)

        : Navigator.pushAndRemoveUntil(context,
      PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 900),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return ScaleTransition(
              scale: animation,
              child: child,
              alignment: Alignment.center,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return screen;
          }),(route) => true,);
  }

  static normalNavigator(
      {required context, required screen, required bool finish}) {
    finish
        ?Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => screen,
      ),
          (route) => false,
    )
        :Navigator.push(
        context, MaterialPageRoute(builder: (context) => screen));
  }

}


