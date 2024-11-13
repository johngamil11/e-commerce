import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:ecommercee/core/widget/custome_favorite_item.dart';
import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/feature/main_layout/products/cubit/Product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widget/dialog_utils.dart';
import '../../../core/widget/search_app_bar.dart';

class WishListTab extends StatelessWidget {
  WishListTab({super.key});

  @override
  Widget build(BuildContext context) {
    // return
    // BlocBuilder<WishListViewModel , WishlistState>(
    // bloc: WishListViewModel.get(context)..getWishlistUseCase,
    // builder: (context , state) {
    //   if(state is GetWishlistStateLoadingState){
    //     return Center(child: CircularProgressIndicator(color: ColorManager.primary,));
    //   } else if (state is GetWishlistStateErrorState){
    //     return Text(state.failures.errorMessage);
    //   }else if (state is GetWishlistStateSuccessState){
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 95.h,
              actions: [
                SearchAppBar(),
              ],
            ),
            body:
                // state is GetWishlistStateSuccessState ?

                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 3 / 1,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return CustomeFavoriteItem();
                    })
            // :
            // Center(child: CircularProgressIndicator(color: ColorManager.primary,),)

            ));
  }
// return Container();
// });
// }
}
