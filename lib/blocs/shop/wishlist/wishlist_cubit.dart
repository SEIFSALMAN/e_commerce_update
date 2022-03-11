import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/shop/products_by_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  static WishlistCubit get(context)=> BlocProvider.of(context);


  List<Product> favorite = [];
  int total = 0 ;

  addToFav(Product product){
    if(favorite.length == 0){
      print ("first cart");
      favorite.add(product);
    }
    else{
      bool found = false;
      for(int i = 0;i < favorite.length; i++){
        if(favorite[i].id == product.id){
          found = true;
          break;
        }

      }
      if(!found){
        favorite.add(product);
      }
      emit(WishlistSuccessState());

    }

  }

  removeFromFav(product){
    favorite.remove(product);
    emit(WishlistSuccessState());
  }


}
