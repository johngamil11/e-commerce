import 'package:ecommercee/domain/entities/ProductResponseEntity.dart';
import 'package:ecommercee/feature/main_layout/products/Products_details/widge/count_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommercee/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/resources/color_manager.dart';
import '../../home_screen/cubit/home_tab_view_model.dart';

class ProductDetails extends StatelessWidget {
  ProductEntity product;

  ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as ProductEntity ;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        centerTitle: true,
        actions: [
          InkWell(onTap: () {}, child: Image.asset(IconAssets.searchIcon)),
          SizedBox(
            width: 5.w,
          ),
          InkWell(onTap: () {}, child: Image.asset(IconAssets.cartIcon)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ImageSlideshow(
              width: 398,
              height: 300,
              initialPage: 0,
              indicatorColor: ColorManager.primary,
              indicatorBackgroundColor: ColorManager.white,
              children: product.images!
                  .map((url) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          url,
                          fit: BoxFit.fill,
                          width: 398,
                          height: 300,
                        ),
                      ))
                  .toList(),
              onPageChanged: (value) {
                print('Page changed: $value');
              },
              autoPlayInterval: 3000,
              isLoop: true,
            ),
            Text(
              product.title ?? '',
              maxLines: 1,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary),
            ),
            Text(
              'EGP ${product.price}',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black),
            ),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border:
                          Border.all(color: ColorManager.primary, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${product.sold} Sold ',
                      style: TextStyle(fontSize: 20, color: ColorManager.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 35.w,
                ),

                Text(
                  '(4.5)',
                  style: TextStyle(
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                // SizedBox(width:15,),
                Icon(
                  Icons.star_rate,
                  color: ColorManager.yellow,
                  size: 20,
                ),
                SizedBox(
                  width: 35.w,
                ),

                CountItemWidget()
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text( product.title ??'', style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold , color: ColorManager.primary),),
            //     Text('EGP ${product.price}' , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold , color: ColorManager.primary),),
            //   ],
            // ),
            SizedBox(
              height: 15.h,
            ),

            // Text(product.title ??'' , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold , color: ColorManager.black , ),),
            SingleChildScrollView(
              child: Column(
                children: [
                  ReadMoreText(
                    product.description ?? '',
                    trimMode: TrimMode.Line,
                    trimLines: 4,
                    colorClickableText: Colors.pink,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Text(product.description ??'' , maxLines:2 , style: TextStyle(fontSize: 16  , color: ColorManager.black),),

            SizedBox(
              height: 180.h,
            ),

            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(color: ColorManager.grey, fontSize: 20),
                    ),
                    Text(product.price.toString(),
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
          ]),
        ),
      ),
    );
  }
}
