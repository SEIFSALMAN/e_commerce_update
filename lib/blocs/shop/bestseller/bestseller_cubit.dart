import 'package:e_commerce/models/shop/bestseller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bestseller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitial());
  static BestSellerCubit get(context) => BlocProvider.of(context);

  List<BestSeller> bestseller= [
    BestSeller(
      image: 'assets/images/bestseller/iphone 13.png',
      id:1 ,
      name: 'iPhone 13 Pro Max , 256GB , 5G',
      price: '23500 LE'
    ),
    BestSeller(
      image: 'assets/images/bestseller/lenove legion 5.png'
      ,id:2 ,
      name: 'Lenovo Legion 5 , 1TB SSD , Intel Core i7-11870H',
      price: '15400 LE'
    ),
    BestSeller(
      image:'assets/images/bestseller/xotic laptop.png',
      id:3 ,
      name: 'Xotic Laptop',
        price: '18000 LE'
    ),
    BestSeller(
      image:'assets/images/bestseller/airpods pro.png',
      id:3 ,
      name: 'Airpods Pro',
        price: '2900 LE'
    ),
    BestSeller(
      image:'assets/images/bestseller/ps5.png',
      id:3 ,
      name: 'PS5',
        price: '12500 LE'
    ),
    BestSeller(
      image:'assets/images/bestseller/lenovo ideapad.png',
      id:3 ,
      name: 'Lenovo ideaPad Core i7 , 16 GB Ram',
        price: '10900 LE'
    ),


  ];
}