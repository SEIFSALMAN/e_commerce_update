
import 'package:e_commerce/services/dio/dio_helper.dart';
import 'package:e_commerce/services/shared_preferences/cache_helper.dart';
import 'package:e_commerce/src/app_root.dart';
import 'package:flutter/material.dart';


main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await SharedPreferencesHelper.init();
runApp(AppRoot());
}