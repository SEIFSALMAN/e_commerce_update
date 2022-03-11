import 'package:buildcondition/buildcondition.dart';
import 'package:e_commerce/blocs/shop/categories/categories_cubit.dart';
import 'package:e_commerce/core/utils/navigator.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:e_commerce/views/shop/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  final text;

  CategoriesList(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                color: AppColor.kPrimaryColor,
              ),
            ),
          ),
        ),
        BlocConsumer<CategoriesCubit, CategoriesState>(
            listener: (context, state) {},
            builder: (context, state) {
              var catCubit = CategoriesCubit.get(context);

              return BuildCondition(
                condition: catCubit.categoriesHub!=null,
                fallback: (context) => CircularProgressIndicator(),
                builder: (context) => Container(
                  height: SizeConfig.defaultSize! * 21,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: catCubit.categoriesHub!.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              AppNavigator.normalNavigator(
                                  context: context,
                                  screen: ProductView(catCubit.categoriesHub!.data![index].id!),
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
                                      catCubit.categoriesHub!.data![index].name
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 15,
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
                ),
              );
            })
      ],
    );
  }
}
