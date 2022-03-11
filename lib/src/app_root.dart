import 'package:e_commerce/blocs/authentication/login/login_cubit.dart';
import 'package:e_commerce/blocs/authentication/register/register_cubit.dart';
import 'package:e_commerce/blocs/shop/Products/products_cubit.dart';
import 'package:e_commerce/blocs/shop/allitems/allitems_cubit.dart';
import 'package:e_commerce/blocs/shop/bestseller/bestseller_cubit.dart';
import 'package:e_commerce/blocs/shop/cart/cart_cubit.dart';
import 'package:e_commerce/blocs/shop/categories/categories_cubit.dart';
import 'package:e_commerce/blocs/shop/wishlist/wishlist_cubit.dart';
import 'package:e_commerce/views/splash_screens/first_splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>CartCubit()),
        BlocProvider(create: (BuildContext context) =>WishlistCubit()),
        BlocProvider(create: (BuildContext context) =>RegisterCubit()),
        BlocProvider(create: (BuildContext context) =>ProductsCubit()),
        BlocProvider(create: (BuildContext context) =>AllItemsCubit()),
        BlocProvider(create: (BuildContext context) =>BestSellerCubit()),
        BlocProvider(create: (BuildContext context) =>LoginCubit()),
        BlocProvider(create: (BuildContext context) =>CategoriesCubit()..getAllCategories()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:FirstSplashView()
        //FirstSplashView()
      ),
    );
  }
}
