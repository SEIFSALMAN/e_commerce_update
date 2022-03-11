import 'dart:async';

import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/services/shared_preferences/cache_helper.dart';
import 'package:e_commerce/views/authentication/login_view.dart';
import 'package:e_commerce/views/home/home.dart';
import 'package:e_commerce/views/onboarding/onboard_view.dart';
import 'package:flutter/material.dart';

class FirstSplashView extends StatefulWidget {
  @override
  _FirstSplashViewState createState() => _FirstSplashViewState();
}

class _FirstSplashViewState extends State<FirstSplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        if(SharedPreferencesHelper.getData(key: 'token') == null){
          AppNavigator.animatedNavigator(finish: true,context: context , screen: LoginView());
        }
        else {
          AppNavigator.animatedNavigator(finish: true,context: context , screen: HomeView());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: Center(
        child: Container(
          height: SizeConfig.screenHeight,
          width: (SizeConfig.screenWidth) ,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }
}
