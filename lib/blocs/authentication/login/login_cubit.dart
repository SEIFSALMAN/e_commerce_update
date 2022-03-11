import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/auth/register.dart';
import 'package:e_commerce/services/dio/dio_helper.dart';
import 'package:e_commerce/services/shared_preferences/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  RegisterHub? registerHub;
  userLogin(String email,String password)
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: 'login',
        data:
        {
          'email':email,
          'password':password,
        }).then((value) {
      print(value.data);
      var jsonData=jsonDecode(value.data);
      registerHub= RegisterHub.fromJson(jsonData);
      SharedPreferencesHelper.saveData(key: 'token', value: registerHub!.data!.accessToken);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState());
    });
  }

}