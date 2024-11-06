import 'package:ecommercee/feature/main_layout/cart/widget/custome_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          InkWell(onTap: () {}, child: Image.asset(IconAssets.searchIcon)),
          SizedBox(
            width: 15.w,
          ),
          InkWell(onTap: () {}, child: Image.asset(IconAssets.cartIcon)),
        ],
      ),
      body: Expanded(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 3 / 1,
                        mainAxisSpacing: 8.h,
                        crossAxisSpacing: 8.w,
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return CustomeItemCart();
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Price',
                        style:
                            TextStyle(color: ColorManager.grey, fontSize: 20),
                      ),
                      Text('3255',
                          style: TextStyle(
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                  SizedBox(
                    width: 95.w,
                  ),
                  // SizedBox(width:15,),

                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ColorManager.primary),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(ImageAssets.cart),
                              color: ColorManager.white,
                            ),
                            Text(
                              'Add to cart',
                              style: TextStyle(
                                  color: ColorManager.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
