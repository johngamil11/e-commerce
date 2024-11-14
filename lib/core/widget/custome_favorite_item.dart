import 'package:ecommercee/core/resources/assets_manager.dart';
import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/domain/entities/GetWishlistResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomeFavoriteItem extends StatelessWidget {
  GetWishlistDataEntity getData;

  CustomeFavoriteItem({required this.getData});
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 150.h,
    //   decoration: BoxDecoration(
    //     border: Border.all(color: ColorManager.primary, width: 2),
    //     borderRadius: BorderRadius.circular(25),
    //   ),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             border: Border.all(color: ColorManager.primary, width: 2),
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //           child: Image.network(
    //             getData.imageCover ??'',
    //             height: 120.h,
    //             width: 130.w,
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: [
    //               Text(
    //                 getData.title ??'',
    //                 style: TextStyle(
    //                     color: ColorManager.primary,
    //                     fontSize: 22,
    //                     fontWeight: FontWeight.bold),
    //               ),
    //               SizedBox(
    //                 width: 25.w,
    //               ),
    //               InkWell(
    //                   onTap: () {},
    //                   child: Image.asset(ImageAssets.favorite_white)),
    //             ],
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 'EGP ${getData.price}',
    //                 style: TextStyle(color: ColorManager.primary, fontSize: 18),
    //               ),
    //               SizedBox(
    //                 width: 15.w,
    //               ),
    //               Container(
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(25),
    //                       color: ColorManager.primary),
    //                   child: Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 4),
    //                     child: Row(
    //                       children: [
    //                         IconButton(
    //                           onPressed: () {},
    //                           icon: Image.asset(ImageAssets.cart),
    //                           color: ColorManager.white,
    //                         ),
    //                         Text(
    //                           'Add to cart',
    //                           style: TextStyle(
    //                               color: ColorManager.white, fontSize: 14),
    //                         ),
    //                       ],
    //                     ),
    //                   ))
    //             ],
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );

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
                getData.imageCover ?? '',
                height: 120.h,
                width: 130.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
