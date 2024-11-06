import 'package:ecommercee/core/resources/assets_manager.dart';
import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:ecommercee/feature/main_layout/home_screen/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        children: HomeTabViewModel.get(context)
            .AdsImages
            .map((url) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    url,
                    fit: BoxFit.fill,
                    width: 210.w,
                    height: 210.h,
                  ),
                ))
            .toList(),
        onPageChanged: (value) {
          print('Page changed: $value');
        },
        autoPlayInterval: 3000,
        isLoop: true,
      ),
    );
  }
}
