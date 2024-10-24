import 'package:ecommercee/core/resources/assets_managet.dart';
import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CustomeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ImageSlideshow(
        width: double.infinity,
        height: 200,
        initialPage: 0,
        indicatorColor: ColorManager.primary,
        indicatorBackgroundColor: ColorManager.white,
        children: [
          Image.asset(
            ImageAssets.slide1,
            fit: BoxFit.cover,
          ),
          Image.asset(
            ImageAssets.slide2,
            fit: BoxFit.cover,
          ),
          Image.asset(
            ImageAssets.slide3,
            fit: BoxFit.cover,
          ),
        ],
        onPageChanged: (value) {
          print('Page changed: $value');
        },
        autoPlayInterval: 3000,
        isLoop: true,
      ),
    );
  }
}
