import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/components/buttons/custom_drawer.dart';
import 'package:e_commerce/core/components/shop/allitems_list_column.dart';
import 'package:e_commerce/core/components/shop/bestseller_list_column.dart';
import 'package:e_commerce/core/components/shop/categories_list_column.dart';
import 'package:e_commerce/core/utils/size_config.dart';
import 'package:e_commerce/core/utils/space.dart';
import 'package:e_commerce/models/shop/slider_images.dart';
import 'package:e_commerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  bool BestIsClicked = false;
  bool AllIsClicked = false;
  var searchController = TextEditingController();
  Future<void> _refresh(){
    return Future.delayed(
        Duration(seconds:1)
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      drawer:CustomDrawer() ,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: Container(
            width: double.infinity,
            height: SizeConfig.defaultSize!*5,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: TextField(
                autofocus: false,
                controller: searchController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child:

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  itemCount: slider.length,
                  options: CarouselOptions(
                    height: 150,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  itemBuilder: (context, itemIndex, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(slider[itemIndex].image))),
                      ),
                    );
                  },
                ),
                CategoriesList('Categories'),
                VerticalSpace(value: 3),
                BestSellerListColumn('Best Seller',BestIsClicked? Icons.favorite : Icons.favorite_border_outlined , (){
                  setState(() {
                    BestIsClicked =! BestIsClicked ;
                  });
                }),
                VerticalSpace(value: 2),
                AllItemsListColumn('All Items', (){
                  setState(() {
                    AllIsClicked =! AllIsClicked ;
                  });
                }, AllIsClicked? Icons.favorite : Icons.favorite_border_outlined ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}