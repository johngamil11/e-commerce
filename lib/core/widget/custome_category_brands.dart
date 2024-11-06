import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercee/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomeCategoryBrands extends StatelessWidget {
  CategoryOrBrandEntity brandList;

// String image ;
// String title ;
  CustomeCategoryBrands({required this.brandList});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // CachedNetworkImage(
      //   height: 100.h,
      //   width: 100.w,
      //   fit: BoxFit.cover,
      //   imageUrl: 'http://via.placeholder.com/350x150',
      //   placeholder: (context, url) => Center(
      //       child: CircularProgressIndicator(
      //         color: ColorManager.primaryDark,
      //       )),
      //   errorWidget: (context, url, error) =>
      //   const Center(child: Icon(Icons.error)),
      //   imageBuilder: (context, imageProvider) {
      //     return Container(
      //       decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         image: DecorationImage(
      //           image: imageProvider,
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     );
      //   },
      // ),
      ClipRRect(
        borderRadius: BorderRadius.circular(100.r),
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.network(
            brandList.image ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Text(brandList.name ?? '')
    ]);
  }
}
