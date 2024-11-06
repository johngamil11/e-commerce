import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:ecommercee/core/routes_manager/routes.dart';
import 'package:ecommercee/core/widget/custom_elevated_button.dart';
import 'package:ecommercee/domain/entities/ProductResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/main_layout/home_screen/cubit/home_tab_view_model.dart';

class CustomeProductsView extends StatelessWidget {
  ProductEntity product;

  // String? productsTitle ;
  // String? price ;
  // String? PriceBeforeDiscount ;
  // String? review ;

  CustomeProductsView({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      IconButton(
          onPressed: () {},
          icon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorManager.primary),
              child: Icon(
                Icons.add,
                size: 20,
                color: ColorManager.white,
              ))),
      Container(
          decoration: BoxDecoration(

              // borderRadius: BorderRadius.all(Radius.circular(15)),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: ColorManager.primary, width: 3)),
          width: 191,
          height: 260,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
            child: Column(
              children: [
                // ImageSlideshow(
                //   width: 191,
                //   height: 130,
                //   initialPage: 0,
                //   indicatorColor: ColorManager.primary,
                //   indicatorBackgroundColor: ColorManager.white,
                //   children:
                //   HomeTabViewModel.get(context).AdsImages.map((url)
                //   =>
                //
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Image.asset(
                //           url,
                //           fit: BoxFit.fill,
                //           width: 191,
                //           height: 15,
                //         ),
                //       ))
                //       .toList(),
                //   onPageChanged: (value) {
                //     print('Page changed: $value');
                //   },
                //   autoPlayInterval: 3000,
                //   isLoop: true,
                // ),
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(14.r)),
                  child: CachedNetworkImage(
                    imageUrl: product.imageCover ?? "",
                    height: 128.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),

                Text(
                  product.title ?? '',
                  maxLines: 1,
                  style: TextStyle(color: ColorManager.primary, fontSize: 16),
                ),
                Text(
                  product.description ?? '',
                  maxLines: 2,
                  style: TextStyle(color: ColorManager.primary, fontSize: 14),
                ),
                Row(
                  children: [
                    Text(
                      'EGP ${product.price}',
                      style: TextStyle(
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'EGP ${product.price} ',
                      style: TextStyle(
                          color: ColorManager.primary,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '(${product.ratingsAverage ?? ''})',
                      style: TextStyle(
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    // SizedBox(width:15,),
                    Icon(
                      Icons.star_rate,
                      color: ColorManager.yellow,
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: ColorManager.primary),
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: ColorManager.white,
                            )))
                  ],
                ),
              ],
            ),
          )),
      IconButton(
          onPressed: () {},
          icon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorManager.white),
              child: Icon(
                Icons.favorite_border,
                size: 30,
                color: ColorManager.primary,
              )))
    ]);
  }
}
