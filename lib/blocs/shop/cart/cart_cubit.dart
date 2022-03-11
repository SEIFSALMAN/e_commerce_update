import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/shop/products_by_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context)=> BlocProvider.of(context);


  List<Product> cart = [];
    int total = 0 ;

  addToCart(Product product){
    if(cart.length == 0){
      print ("first cart");
      cart.add( product);
    }
    else{
      bool found = false;
      for(int i = 0;i < cart.length; i++){
        if(cart[i].id == product.id){
            found = true;
            break;
        }

      }
      if(!found){
        cart.add(product);
      }
      emit(CartSuccessState());

    }

  }

  removeFromCart(product){
    cart.remove(product);
    emit(CartSuccessState());
  }

  getAllPrice(){

    for(int i = 0 ; i< cart.length ; i++){
      total =total+ cart[i].price!;

    }
    return total;

  }

}
