import 'package:e_commerce/core/components/buttons/container_image.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.kPrimaryColor,title: Align(
          alignment: Alignment.centerRight,
          child: Text('About Us')),),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              VerticalSpace(value : 2),
              ContainerImage('assets/images/logo.png', SizeConfig.defaultSize!*15, SizeConfig.screenWidth!*15),
              VerticalSpace(value : 2),
              Container(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('We are portatile Company!',style: TextStyle(color: AppColor.kPrimaryColor,fontSize: 20,fontFamily: 'Rowdies'),),
                  VerticalSpace(value : 2),
                  Text('Early computers were meant to be used only for Calculations.'
                      ' \n Simple manual instrument like the abacus have aided people in doing calculations since ancient times.\n '
                      'Early in the industrial Revolution, some mechanical devices were built yo automate long tedious tasks, such as guiding patterns for looms \n'
                      'More sophisticated electrical mechanics did specialized analog calculations in the early 20th century. The first digital electronic calculating machines were developed during World War II \n'
                      'The first semiconductor transistor in he late 1940s were followed by the silicon-based MOSFET (MOS). ',textAlign: TextAlign.start,style: TextStyle(fontSize: 18 ,fontFamily: 'Comfortaa'),)
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

