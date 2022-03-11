import 'package:e_commerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class ContainerImage extends StatelessWidget {
final img;
final height;
final width;


ContainerImage(this.img, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(img),
        ),
      ),
    );
  }
}
