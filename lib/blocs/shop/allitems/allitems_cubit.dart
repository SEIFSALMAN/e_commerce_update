import 'package:e_commerce/models/shop/all_items.dart';
import 'package:e_commerce/models/shop/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'allitems_state.dart';

class AllItemsCubit extends Cubit<AllItemsState> {
  AllItemsCubit() : super(AllItemsInitial());
  static AllItemsCubit get(context) => BlocProvider.of(context);

  List<AllItems> allitems= [

    AllItems(
      image: 'assets/images/allitems/lenove legion 5.png'
      ,id:1 ,
      price: '15400 LE',
      name: 'Lenovo Legion 5 , 1TB SSD , Intel Core i7-11870H',
    ),
    AllItems(
      image: 'assets/images/allitems/airpods pro.png',
      id:2 ,
      name: 'Airpods Pro',
        price: '2900 LE'
    ),
    AllItems(
      image:'assets/images/allitems/lenovo ideapad.png',
      id:3 ,
      name: 'Lenovo ideaPad Core i7 , 16 GB Ram',
        price: '10900 LE'
    ),
    AllItems(
      image:'assets/images/allitems/xotic laptop.png',
      id:3 ,
      name: 'Xotic Laptop',
        price: '18000 LE'
    ),
    AllItems(
        image:'assets/images/allitems/iphone 13.png',
        id:3 ,
        name: 'iPhone 13 Pro Max , 256GB , 5G',
        price: '23500 LE'
    ),
    AllItems(
        image:'assets/images/allitems/ps5.png',
        id:3 ,
        name: 'PS5',
        price: '12500 LE'
    ),
    AllItems(
      image:'assets/images/allitems/lenovo e45.png',
      id:3 ,
      price: '5600 LE',
      name: 'Lenovo E45 , 8GB Ram , Core i3-3550U',
    ),
  ];
}