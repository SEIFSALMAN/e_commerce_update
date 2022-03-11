import 'package:e_commerce/blocs/shop/allitems/allitems_cubit.dart';
import 'package:e_commerce/core/components/buttons/custom_elevated_button.dart';
import 'package:e_commerce/core/toast/toast_config.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/enums/toast_states.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllItemsListColumn extends StatelessWidget {
final text ;
final function;
final icon;

AllItemsListColumn(this.text, this.function, this.icon);

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
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: AppColor.kPrimaryColor,
              ),
            ),
          ),
        ),
        BlocConsumer<AllItemsCubit, AllItemsState>(
            listener: (context, state) {},
            builder: (context, state) {
              var allCubit = AllItemsCubit.get(context);
              return Container(
                height: SizeConfig.defaultSize!*30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allCubit.allitems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20))),
                              width: SizeConfig.screenWidth!*0.55,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(
                                                20, 10, 20, 0),
                                            child: Image.asset(allCubit
                                                .allitems[index].image),
                                          ),
                                          Text(
                                            allCubit.allitems[index].name
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.bold),
                                            maxLines: 1,
                                          ),
                                          Text(
                                            allCubit.allitems[index].price,
                                            style: TextStyle(
                                                fontFamily: 'Rowdies',
                                                color: Colors.red,
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.bold),
                                            maxLines: 1,
                                          ),

                                        ],
                                      ),
                                    ),
                                    CustomElevatedButton(
                                        SizeConfig.screenWidth! *
                                            0.49,
                                            () {
                                          ToastConfig.showToast(msg: 'Product Added Successfully!', toastStates: ToastStates.Success);},
                                        'Add to Cart!')
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: function,
                              icon: Icon(icon,color: Colors.red,),
                            ),
                          ],

                        ),
                      );
                    }),
              );
            })
      ],
    );
  }
}
