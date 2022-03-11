import 'package:e_commerce/blocs/shop/categories/categories_cubit.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:e_commerce/views/shop/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesGrid extends StatelessWidget {

  final text;

  CategoriesGrid(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VerticalSpace(value: 1),
        Align(
          alignment: Alignment.center,
          child: Text(text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
              color: AppColor.kPrimaryColor,
            ),
          ),
        ),
        VerticalSpace(value: 1),

        BlocConsumer<CategoriesCubit, CategoriesState>(
            listener: (context, state) {},
            builder: (context, state) {
              var catCubit = CategoriesCubit.get(context);
              return  Container(
                height: SizeConfig.defaultSize!*100,
                width: SizeConfig.screenWidth!*10,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: catCubit.categoriesHub!.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0),
                        child: InkWell(
                          onTap: () {
                            AppNavigator.normalNavigator(context: context, screen: ProductView(catCubit.categoriesHub!.data![index].id!
                            ), finish: false);
                          } ,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20))),
                            width: SizeConfig.screenWidth!*0.9,
                            height: SizeConfig.defaultSize!*500,
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: SizeConfig.defaultSize!*17
                                    ,child: Image.asset(
                                        'assets/images/categories/laptop.png'),
                                  ),
                                  Text(
                                    catCubit.categoriesHub!.data![index].name
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 14,
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
              );
            })
      ],
    );
  }
}
