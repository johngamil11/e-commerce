import 'package:ecommercee/core/resources/assets_manager.dart';
import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommercee/feature/main_layout/favorite_tab/cubit/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

@injectable
class CustomeFavoriteItem extends StatelessWidget {
  GetWishlistDataEntity getData;

  CustomeFavoriteItem({required this.getData});
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
                getData.imageCover ?? '',
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
                      getData.title ?? '',
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
                        WishListViewModel.get(context)
                            .DeleteInWishlist(getData.id ?? '');
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
                    'EGP ${getData.price}',
                    style: TextStyle(color: ColorManager.primary, fontSize: 18),
                  ),
                  SizedBox(
                    width: 45.w,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
