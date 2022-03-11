import 'package:e_commerce/core/components/shop/categories_grid_view.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Align(
            alignment: Alignment.centerRight,
            child: Text('Categories',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),)),
      ),
      body: SingleChildScrollView(
      child:
      Expanded(
        child: Column(
          children: [
            CategoriesGrid('All Categories'),
          ],
        ),
      )
      ),
    );
  }
}
