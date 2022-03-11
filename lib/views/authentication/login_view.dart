import 'package:e_commerce/blocs/authentication/login/login_cubit.dart';
import 'package:e_commerce/core/components/buttons/container_image.dart';
import 'package:e_commerce/core/components/buttons/custom_elevated_button.dart';
import 'package:e_commerce/core/components/buttons/custom_text.dart';
import 'package:e_commerce/core/components/buttons/custom_text_fields.dart';
import 'package:e_commerce/core/components/buttons/custom_textbutton_icon.dart';
import 'package:e_commerce/core/components/social_icons.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:e_commerce/views/authentication/register_view.dart';
import 'package:e_commerce/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginSuccessState)
    {
      AppNavigator.normalNavigator(
        context: context,
        screen: HomeView(),
        finish: false,
      );
    }
  },
  builder: (context, state) {
    var loginCubit = LoginCubit.get(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              VerticalSpace(
                value: 10,
              ),
              ContainerImage('assets/images/logo.png',
                  SizeConfig.defaultSize! * 22, SizeConfig.screenWidth),
              CustomText('Welcome to E-commerce App.', 18.0,  const EdgeInsets.fromLTRB(0, 15, 0, 20), AppColor.kPrimaryColor),
              CustomText('Please Login to your account', 13.0, EdgeInsets.zero, Colors.black),
              CustomTextField(
                  'E-mail', Icons.mail, false, null, 'E-mail', emailController),
              CustomTextField(
                  'Password',
                  Icons.vpn_key_rounded,
                  isObscure,
                  IconButton(
                    onPressed: (){
                      setState(() {
                        isObscure =! isObscure;
                      });
                    },
                    icon: Icon(isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                  'Password',
                  passwordController),
              CustomTextButtonIcon(const EdgeInsets.fromLTRB(170, 10, 0, 20), AppColor.kPrimaryColor, 'Forget password', Icons.edit, ForgetPasswordView()),
              CustomElevatedButton(SizeConfig.screenWidth! * 0.9,

                   () {
                     if (_formKey.currentState!.validate()) {
                       loginCubit.userLogin(
                           emailController.text,
                           passwordController.text);
                      if(state is LoginSuccessState){
                        AppNavigator.normalNavigator(
                            context: context, screen: HomeView(), finish: true);
                      }
                      else if(state is LoginErrorState){
                        print('Error!');
                      }
                     }
              }, 'Login'),
              VerticalSpace(value: 2),
              SocialIcons(),

              CustomText('Doesn\'t have an account?',13.0,const EdgeInsets.symmetric(vertical: 18.0),Colors.black),
              CustomElevatedButton(SizeConfig.screenWidth! * 0.9,
                   () {
                AppNavigator.normalNavigator(
                    context: context, screen: RegisterView(), finish: false);
              }, 'Sign Up'),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}