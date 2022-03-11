import 'package:e_commerce/blocs/authentication/register/register_cubit.dart';
import 'package:e_commerce/core/components/buttons/container_image.dart';
import 'package:e_commerce/core/components/buttons/custom_elevated_button.dart';
import 'package:e_commerce/core/components/buttons/custom_text.dart';
import 'package:e_commerce/core/components/buttons/custom_text_fields.dart';
import 'package:e_commerce/core/components/social_icons.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:e_commerce/views/authentication/login_view.dart';
import 'package:e_commerce/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isObscure = true;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          AppNavigator.normalNavigator(
            context: context,
            screen: HomeView(),
            finish: false,
          );
        }
      },
      builder: (context, state) {
        var registerCubit = RegisterCubit.get(context);

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
                      SizeConfig.defaultSize! * 15, SizeConfig.screenWidth),

                  CustomText('Welcome to E-Commerce App.', 19.0, EdgeInsets.fromLTRB(0, 12, 0, 11),AppColor.kPrimaryColor),
                  CustomText('Please Sign Up to Join our Application', 13.0, EdgeInsets.zero, Colors.black),
                  CustomTextField('Username', Icons.people_alt_rounded, false,
                      null, 'Username', nameController),
                  CustomTextField('E-mail', Icons.mail, false, null, 'E-mail',
                      emailController),
                  CustomTextField(
                      'Password',
                      Icons.vpn_key_rounded,
                      isObscure,
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                      ),
                      'Password',
                      passwordController),
                  CustomTextField(
                    'Confirm Password',
                    Icons.vpn_key_rounded,
                    isObscure,
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(isObscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                    ),
                    'Confirm Password',
                    passwordConfirmController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11.0),
                    child:
                        CustomElevatedButton(SizeConfig.screenWidth! * 0.9, () {
                      if (_formKey.currentState!.validate()) {
                        registerCubit.userRegister(nameController.text,
                            emailController.text, passwordController.text);
                      }
                      if (state is RegisterSuccessState) {
                        AppNavigator.normalNavigator(
                            context: context,
                            screen: HomeView(),
                            finish: false);
                      } else if (state is RegisterErrorState) {
                        print('error');
                      }
                    }, 'Continue'),
                  ),
                  SocialIcons(),
                  CustomText(
                      'Already have an account ?', 17.0, EdgeInsets.all(16.0),Colors.black),
                  CustomElevatedButton(SizeConfig.screenWidth! * 0.9, () {
                    AppNavigator.normalNavigator(
                        context: context, screen: LoginView(), finish: false);
                  }, 'Login'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
