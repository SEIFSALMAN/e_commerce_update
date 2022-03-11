import 'package:e_commerce/core/components/buttons/custom_elevated_button.dart';
import 'package:e_commerce/core/components/buttons/custom_text_fields.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/views/home/home.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {

  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    title: Text('Edit Profile',style: TextStyle(color: Colors.black),),
    centerTitle: true,
    ),
      body: Column(
        children: [
          VerticalSpace(value:7 ),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/profile.jpg'),),
                shape: BoxShape.circle),
            height: SizeConfig.screenHeight!*0.2,
            width:  SizeConfig.screenWidth!*1,
          ),
          VerticalSpace(value: 2),
          Text(
            'Agent Skye',
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.black),
          ),
          VerticalSpace(value: 2),
          CustomTextField('Address',null , false, Icon(Icons.add_location_alt), 'Enter your Address!', addressController),
          CustomTextField('Phone Number',null , false, Icon(Icons.phone), 'Enter your phone!', phoneController),
          CustomTextField('Password',null , false, Icon(Icons.lock_outline_rounded), 'Enter your password!', passwordController),
          Padding(
            padding: const EdgeInsets.only(top: 100.0,right: 30,left: 30,bottom: 20),
            child: CustomElevatedButton(double.infinity, (){
              AppNavigator.normalNavigator(context: context, screen: HomeView(), finish: true);
            }, 'Submit'),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.start,

      ),
    );
  }
}
