import 'package:e_commerce/core/components/buttons/custom_textbutton_icon.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/services/shared_preferences/cache_helper.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:e_commerce/views/authentication/login_view.dart';
import 'package:e_commerce/views/drawer/about_us.dart';
import 'package:e_commerce/views/drawer/cart_view.dart';
import 'package:e_commerce/views/drawer/categories_view.dart';
import 'package:e_commerce/views/drawer/contact_us.dart';
import 'package:e_commerce/views/drawer/edit_profile.dart';
import 'package:e_commerce/views/drawer/wishlist_view.dart';
import 'package:flutter/material.dart';

import '../../utils/space.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: SizeConfig.defaultSize!*40,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.kPrimaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/profile.jpg')),
                        shape: BoxShape.circle),
                    height: SizeConfig.screenHeight!*0.2,
                    width:  SizeConfig.screenWidth!*0.6,
                  ),
                  VerticalSpace(value: 3),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Agent Skye',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      CustomTextButtonIcon(EdgeInsets.zero, Colors.white, 'Edit', Icons.edit, EditProfileView()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.list_alt_outlined),
            title: const Text('Categories'),
            contentPadding: EdgeInsets.only(left: 20),
            onTap: () {
              Navigator.pop(context);
              AppNavigator.normalNavigator(context: context, screen: CategoriesView(), finish: false);

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 20),
            leading: Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Navigator.pop(context);
              AppNavigator.normalNavigator(context: context, screen: CartView(), finish: false);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 20),
            leading: Icon(Icons.favorite_border),
            title: const Text('Wishlist'),
            onTap: () {
              Navigator.pop(context);
              AppNavigator.normalNavigator(context: context, screen: WishlistView(), finish: false);

            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 20),
            leading: Icon(Icons.shopping_bag),
            title: const Text('My Orders'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 20),
            leading: Icon(Icons.phone),
            title: const Text('Contact us'),
            onTap: () {

              Navigator.pop(context);
              AppNavigator.normalNavigator(context: context, screen: ContactUsView(), finish: false);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 20),
            leading: Icon(Icons.info_outline),
            title: const Text('About us'),
            onTap: () {
              Navigator.pop(context);
              AppNavigator.normalNavigator(context: context, screen: AboutUsView(), finish: false);
            },
          ),

          ListTile(
            contentPadding: EdgeInsets.only(left: 20),
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text(
              'Log out',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context);
              SharedPreferencesHelper.removeData(key: 'token');
              AppNavigator.normalNavigator(context: context, screen: LoginView(), finish: true);
            },
          ),
        ],
      ),
    );
  }
}


