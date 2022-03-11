import 'dart:convert';

import 'package:e_commerce/models/shop/categories.dart';
import 'package:e_commerce/services/dio/dio_helper.dart';
import 'package:e_commerce/services/shared_preferences/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);


  CategoriesHub ?categoriesHub;

  List<CategoryModel> categories= [];


  getAllCategories(){
    emit(CategoriesLoadingState());
    DioHelper.getData(
      url: 'categories',
      token: SharedPreferencesHelper.getData(key: 'token')
    ).then((value) {
      print(value.data);
      var jsonData=jsonDecode(value.data);
      categoriesHub = CategoriesHub.fromJson(jsonData);
      emit(CategoriesSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(CategoriesErrorState());
    });
  }


}