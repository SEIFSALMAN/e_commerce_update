import 'package:e_commerce/blocs/shop/Products/products_cubit.dart';
import 'package:e_commerce/blocs/shop/cart/cart_cubit.dart';
import 'package:e_commerce/blocs/shop/wishlist/wishlist_cubit.dart';
import 'package:e_commerce/core/components/buttons/custom_elevated_button.dart';
import 'package:e_commerce/core/toast/toast_config.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/enums/toast_states.dart';
import 'package:e_commerce/models/shop/products_by_category.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:e_commerce/views/drawer/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProductView extends StatefulWidget {

  final Product product;


  SingleProductView(this.product);

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  bool IsClicked = false;

  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        
        return  Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.product.name.toString(),style: TextStyle(color: Colors.black),),
                IconButton(
                  icon: Icon(Icons.shopping_cart_rounded),
                  onPressed: (){
                    AppNavigator.normalNavigator(context: context, screen: CartView(), finish: false);
                  }
                )
              ],
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: SizeConfig.defaultSize! * 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      image: DecorationImage(image: AssetImage(
                          'assets/images/categories/laptop.png'))
                  ),
                ),
                VerticalSpace(value: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocConsumer<WishlistCubit, WishlistState>(
                           listener: (context, state) {
                             // TODO: implement listener
                           },
                           builder: (context, state) {
                            var wishCubit = WishlistCubit.get(context);
                             return Row(
                        children: [
                          Text(widget.product.name.toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                          IconButton(
                            onPressed: (){
                              setState(() {
                                widget.product.isFavorite =! widget.product.isFavorite;
                                wishCubit.addToFav(widget.product);
                              });
                            },
                            icon: Icon(widget.product.isFavorite? Icons.favorite : Icons.favorite_border_outlined,color: Colors.red ,size: 30,),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      );
  },
),
                      VerticalSpace(value: 1),
                      Text("Description",style: TextStyle(color: AppColor.kPrimaryColor),),
                      SizedBox(height:30),
                      Text('Quantity : '+widget.product.qty.toString(),style: TextStyle(fontSize: 16),),
                      Text('Created At : '+widget.product.createdAt.toString(),style: TextStyle(fontSize: 16),),
                      Text('Tax : '+widget.product.tax.toString(),style: TextStyle(fontSize: 16),),
                      Text('Price : '+widget.product.price.toString(),style: TextStyle(fontSize: 16),),
                    ],
                  ),
                ),
                VerticalSpace(value: SizeConfig.defaultSize!*0.5),
                BlocConsumer<CartCubit, CartState>(
                       listener: (context, state) {

                       },
                       builder: (context, state) {
                         var cartCubit = CartCubit.get(context);
                         return Padding(
                           padding: const EdgeInsets.all(27.0),
                           child: CustomElevatedButton(double.infinity, (){
                    cartCubit.addToCart(widget.product);
                    ToastConfig.showToast(msg: 'Product Added Successfully!', toastStates: ToastStates.Success);
                  }, 'Add To Cart'),
                );
  },
),
                Center(child: Text('Updated At : '+widget.product.updatedAt.toString(),style: TextStyle(fontSize: 12),)),

              ],
            ),
          ),
        );
      },
    );
  }
}
