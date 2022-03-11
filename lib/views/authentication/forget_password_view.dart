import 'package:e_commerce/core/components/buttons/custom_text_fields.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {



  var emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        backgroundColor: AppColor.kPrimaryColor,
        title: Text('Login Help!',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,190),
              child: Column(
                children: [

                  Text(
                    'Reset your password!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  VerticalSpace(value: 5),
                  Text(
                    'Please enter your email to help you reset your password !',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  VerticalSpace(value: 5),
                  CustomTextField(
                      'E-mail', Icons.mail, false, null, 'E-mail', emailController),
                  VerticalSpace(value: 7),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.white,
                      primary: AppColor.kPrimaryColor, // background (button) color
                      onPrimary: Colors.white, // foreground (text) color
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,10,20,10),
                      child: const Text(
                        'Find Your Password !', style: TextStyle(fontSize: 15),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
