import 'package:e_commerce/blocs/shop/cart/cart_cubit.dart';
import 'package:e_commerce/core/components/buttons/custom_elevated_button.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:e_commerce/views/shop/single_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Cart',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cartCubit = CartCubit.get(context);
                return Column(
                  children: [
                    Container(
                      height: SizeConfig.defaultSize! * 60,
                      width: SizeConfig.screenWidth! * 100,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: cartCubit.cart.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 20),
                                child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        height: SizeConfig.defaultSize! * 20,
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                height:
                                                    SizeConfig.defaultSize! * 17,
                                                child: Image.asset(
                                                    'assets/images/categories/laptop.png'),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    cartCubit.cart[index].name!,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    'Price: ' +
                                                        cartCubit
                                                            .cart[index].price
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.red),
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            counter++;
                                                          });
                                                        },
                                                        icon: Icon(
                                                            Icons
                                                                .add_circle_outline,
                                                            size: 30),
                                                      ),
                                                      Text(
                                                        counter.toString(),
                                                        style: TextStyle(
                                                            fontSize: 26),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            if (counter < 2) {
                                                              counter = 1;
                                                            } else {
                                                              counter--;
                                                            }
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .remove_circle_outline,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.highlight_remove,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          cartCubit.removeFromCart(
                                              cartCubit.cart[index]);
                                        },
                                      ),
                                    ]),
                              );
                            }),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'Price :  ' + cartCubit.getAllPrice().toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),
                      height: SizeConfig.defaultSize! * 5,
                      width: SizeConfig.screenWidth! * 0.8,
                      color: Colors.grey[300],
                    ),
                    VerticalSpace(value: 2),
                    CustomElevatedButton(SizeConfig.screenWidth! * 0.7, () {
                      cartCubit.getAllPrice().toString();
                    }, 'Checkout')
                  ],
                );
              })
        ],
      ),
    );
  }
}
