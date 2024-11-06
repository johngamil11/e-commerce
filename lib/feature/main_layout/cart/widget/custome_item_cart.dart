import 'package:ecommercee/feature/main_layout/products/Products_details/widge/count_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';

class CustomeItemCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.primary, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.primary, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                ImageAssets.slide1,
                height: 120.h,
                width: 130.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Nike Air Jordon',
                    style: TextStyle(
                        color: ColorManager.primary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.delete_forever,
                        size: 30,
                        color: ColorManager.grey,
                      )),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Text(
                    'EGP 3500',
                    style: TextStyle(color: ColorManager.primary, fontSize: 18),
                  ),
                  SizedBox(
                    width: 45.w,
                  ),
                  CountItemWidget()
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
