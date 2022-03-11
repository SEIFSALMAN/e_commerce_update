import 'package:buildcondition/buildcondition.dart';
import 'package:e_commerce/blocs/shop/Products/products_cubit.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/views/shop/single_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatefulWidget {
final int id ;

  ProductView(this.id);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {


  @override
  void initState() {
    ProductsCubit.get(context).getAllProducts(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit,ProductsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var productCubit = ProductsCubit.get(context);
        return Scaffold(
            appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Categories',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        ),
          body: BuildCondition(
            condition: productCubit.productsHub!=null,
            fallback: (context) => Center(child: CircularProgressIndicator()),
            builder: (context) => ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productCubit.productsHub!.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
                  child: InkWell(
                    onTap: () {
                      AppNavigator.normalNavigator(
                          context: context,
                          screen: SingleProductView(productCubit.productsHub!.data![index]),
                          finish: false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                          BorderRadius.all(Radius.circular(20))),
                      width: SizeConfig.screenWidth! * 0.3917,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                                'assets/images/categories/laptop.png'),
                            Text(
                              productCubit.productsHub!.data![index].name
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ));
      },
    );
  }
}
