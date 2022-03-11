import 'package:e_commerce/core/components/buttons/custom_elevated_button.dart';
import 'package:e_commerce/core/toast/toast_config.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/enums/toast_states.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('Contact Us' , style: TextStyle(color: Colors.black , fontSize: 19),),
        ),
      ),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpace(value: 5),
                Row(
                  children: [
                    Icon(Icons.phone),
                    HorizontalSpace(value: 4,),
                    Text('+123 456 789 234 \nMobile')
                  ],
                ),
                VerticalSpace(value: 5),
                Row(
                  children: [
                    Icon(Icons.mail),
                    HorizontalSpace(value: 4,),
                    Text('seifxofficial@gmail.com \nMail')
                  ],
                ),
                VerticalSpace(value: 5),
                Row(
                  children: [
                    Icon(Icons.message),
                    HorizontalSpace(value: 4,),
                    Text('+123 456 789 234 \nMessage')
                  ],
                ),
                VerticalSpace(value: 5),
                Text('Send Message' ,style: TextStyle(fontSize: 19 , color: AppColor.kPrimaryColor),),
                VerticalSpace(value: 5),
                TextFormField(
                  validator:  (value) {
                    if (value != null && value.trim().length < 3) {
                      return 'This field requires a minimum of 3 characters';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),),

                ),
                VerticalSpace(value: 3),
                TextFormField(
                  validator:  (value) {
                    if (value != null && value.trim().length < 3) {
                      return 'This field requires a minimum of 3 characters';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    ),),

                ),
                VerticalSpace(value: 3),
                TextFormField(
                  validator:  (value) {
          if (value != null && value.trim().length < 3) {
          return 'This field requires a minimum of 3 characters';
          }

          return null;
          },
                  decoration: InputDecoration(
                      labelText: 'Message',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),),

                ),
                VerticalSpace(value: 3),
                Center(child: CustomElevatedButton(SizeConfig.screenWidth!*0.7, (){
                  if (_formKey.currentState!.validate()) {
                    ToastConfig.showToast(msg: 'Report Sent Successfully !', toastStates: ToastStates.Success);
                  }
                }, 'Send Report'))
              ],
            ),
          ),
        ),
      ),

    );
  }
}
