import 'package:ecommercee/feature/main_layout/cart/cubit/cart_screen_view_model.dart';
import 'package:ecommercee/feature/main_layout/products/Products_details/widge/count_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../domain/entities/GetCartResponseEntity.dart';

class CustomeItemCart extends StatelessWidget {
  GetProductsCartEntity productEntity;

  CustomeItemCart({required this.productEntity});
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
              child: Image.network(
                productEntity.product!.imageCover ?? '',
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
                  Container(
                    width: 180,
                    child: Text(
                      productEntity.product!.title ?? '',
                      maxLines: 1,
                      style: TextStyle(
                        color: ColorManager.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  InkWell(
                      onTap: () {
                        CartScreenViewModel.get(context)
                            .deleteItemInCart(productEntity.product!.id ?? '');
                      },
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
                    'EGP ${productEntity.price}',
                    style: TextStyle(color: ColorManager.primary, fontSize: 18),
                  ),
                  SizedBox(
                    width: 45.w,
                  ),
                  CountItemWidget(
                    cartEntity: productEntity,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
