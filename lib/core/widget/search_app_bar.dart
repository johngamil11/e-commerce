import 'package:ecommercee/core/widget/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/assets_managet.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class SearchAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImageAssets.routeSearch),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: ColorManager.primary,
                  style: getRegularStyle(
                      color: ColorManager.primary, fontSize: FontSize.s16),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: AppMargin.m12.w, vertical: AppMargin.m8.h),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10000),
                        borderSide: BorderSide(
                            width: AppSize.s1, color: ColorManager.primary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10000),
                        borderSide: BorderSide(
                            width: AppSize.s1, color: ColorManager.primary)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10000),
                        borderSide: BorderSide(
                            width: AppSize.s1, color: ColorManager.primary)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10000),
                        borderSide: BorderSide(
                            width: AppSize.s1, color: ColorManager.primary)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10000),
                        borderSide: BorderSide(
                            width: AppSize.s1, color: ColorManager.error)),
                    prefixIcon: ImageIcon(
                      AssetImage(IconAssets.searchIcon),
                      color: ColorManager.primary,
                    ),
                    hintText: "what do you search for?",
                    hintStyle: getRegularStyle(
                        color: ColorManager.primary, fontSize: FontSize.s16),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: Image.asset(IconAssets.cartIcon))
            ],
          )
        ],
      ),
    );
  }
}
