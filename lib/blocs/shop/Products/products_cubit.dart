import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/shop/products_by_category.dart';
import 'package:e_commerce/services/dio/dio_helper.dart';
import 'package:e_commerce/services/shared_preferences/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  static ProductsCubit get(context)=> BlocProvider.of(context);

  ProductsHub ?productsHub;
  ProductsHub ?singleProductsHub;

  List<ProductsHub> products= [];



  getSingleProduct(int id){
    emit(ProductsLoadingState());
    DioHelper.getData(
        url: 'product/$id',
        token: SharedPreferencesHelper.getData(key: 'token')
    ).then((value) {
      print(value.data);
      var jsonData=jsonDecode(value.data);
      singleProductsHub = ProductsHub.fromJson(jsonData);
      emit(ProductsSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(ProductsErrorState());
    });
  }


  getAllProducts(int id){
    emit(ProductsLoadingState());
    DioHelper.getData(
        url: 'product',
        query: {
          'category' : id
        },
        token: SharedPreferencesHelper.getData(key: 'token')
    ).then((value) {
      print(value.data);

      var jsonData=jsonDecode(value.data);
      productsHub = ProductsHub.fromJson(jsonData);
      emit(ProductsSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(ProductsErrorState());
    });
  }


}
