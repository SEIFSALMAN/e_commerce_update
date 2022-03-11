import 'package:e_commerce/core/components/buttons/container_image.dart';
import 'package:e_commerce/core/components/buttons/custom_elevated_button.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/models/onboarding.dart';
import 'package:e_commerce/services/shared_preferences/cache_helper.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:e_commerce/views/authentication/login_view.dart';
import 'package:e_commerce/views/home/home.dart';
import 'package:flutter/material.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  _OnBoardViewState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  int currentIndex = 0;
  late PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: contents.length,
                onPageChanged: (int index){
                setState(() {
                  currentIndex = index;
                });
                },
                itemBuilder: (_,i){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30,80,30,90),
                  child: Column(
                    children: [
                      ContainerImage(contents[i].image,
                          SizeConfig.defaultSize! * 38, SizeConfig.screenWidth),
                      VerticalSpace(value:4.45),

                      Center(
                        child: Text(contents[i].title ,textAlign: TextAlign.center, style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),
                        ),
                      ),

                    ],
                  ),
                );
                },
            ),
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, (index) => buildDot(index,context)),),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomElevatedButton(SizeConfig.screenWidth, (){
              if(currentIndex == contents.length -1){
                if(SharedPreferencesHelper.getData(key: 'token') == null){
                  AppNavigator.animatedNavigator(finish: true,context: context , screen: LoginView());
                }
                else {
                  AppNavigator.animatedNavigator(finish: true,context: context , screen: HomeView());
                }
              }
              controller.nextPage(duration: Duration(milliseconds:190 ), curve: Curves.bounceIn);
            }, currentIndex == contents.length -1 ? "Continue" : "Next"),
          )
        ],
      ),

    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.kPrimaryColor,
      ),
    );
  }
}
