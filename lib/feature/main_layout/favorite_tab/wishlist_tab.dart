import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:ecommercee/core/widget/custome_favorite_item.dart';
import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/feature/main_layout/favorite_tab/cubit/wishlist_state.dart';
import 'package:ecommercee/feature/main_layout/favorite_tab/cubit/wishlist_view_model.dart';
import 'package:ecommercee/feature/main_layout/products/cubit/Product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/widget/dialog_utils.dart';
import '../../../core/widget/search_app_bar.dart';
import '../cart/cubit/cart_screen_view_model.dart';
import '../cart/cubit/cart_states.dart';
import '../cart/widget/custome_item_cart.dart';

class WishListTab extends StatelessWidget {
  WishListTab({super.key});

  @override
  Widget build(BuildContext context) {
//     return BlocListener(
//         bloc:WishListViewModel.get(context)..getWishlistUseCase,
//     listener: (context, state) {
//     if (state is GetWishlistErrorState) {
//     return DialogUtils.showMessage(message:state.failures.errorMessage ,
//     context: context);
//     }
//     },
//     child:
//     BlocBuilder<WishListViewModel , WishlistState>(
//     bloc:WishListViewModel.get(context)..addtoWishlistUseCase..getWishlistUseCase,
//     builder: (context , state) {
//       if(state is GetWishlistLoadingState){
//         return Center(child: CircularProgressIndicator(color: ColorManager.primary,));
//       } else if (state is GetWishlistErrorState ){
//         return Text(state.failures.errorMessage);
//       }else if (state is GetWishlistSuccessState){
//     return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Scaffold(
//             appBar: AppBar(
//               toolbarHeight: 95.h,
//               actions: [
//                 SearchAppBar(),
//               ],
//             ),
//             body:
//             ListView.builder(
//                 itemCount: state.getWishlistResponseEntity.data!.length ,
//                 itemBuilder: (context, index) {
//                   return CustomeFavoriteItem(getData: state.getWishlistResponseEntity.data![index]);
//                 })            ));
//   }
// return Container();
// }));
    //todo another code
    //   return BlocConsumer<WishListViewModel, WishlistState>(
    //   bloc: WishListViewModel.get(context)..getWishlistUseCase,
    //   listener: (context, state) {
    //     if (state is WishlistStateErrorState) {
    //       DialogUtils.showMessage(
    //           context: context, message: state.failures.errorMessage);
    //     } else if (state is WishlistStateErrorState) {
    //       DialogUtils.showMessage(
    //           context: context, message: state.failures.errorMessage);
    //     }
    //   },
    //   builder: (context, state) {
    //     return Scaffold(
    //       body: WishListViewModel.get(context).wishlist.isEmpty
    //           ? Center(
    //         child: CircularProgressIndicator(
    //           color: ColorManager.primary,
    //         ),
    //       )
    //           : GridView.builder(
    //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               mainAxisSpacing: 2.h,
    //               crossAxisSpacing: 8.w,
    //               childAspectRatio: 8 / 12),
    //           itemCount:
    //               WishListViewModel.get(context).wishlist.length ,
    //           scrollDirection: Axis.vertical,
    //           itemBuilder: (context, index) {
    //             return CustomeFavoriteItem(getData:
    //             WishListViewModel.get(context).wishlist[index]
    //             );
    //           }),
    //
    //       // CustomeProductsView()
    //     );
    //   },
    // );
//todo 3
//     return BlocBuilder<WishListViewModel, WishlistState>(
//     bloc: WishListViewModel.get(context)..getWishlistUseCase,
//     builder: (context, state) {
//     return Scaffold(
//     appBar: AppBar(
//     title: Text(
//     'Product Details',
//     style: TextStyle(fontWeight: FontWeight.bold),
//     ),
//     centerTitle: true,
//     ),
//     body: state is GetWishlistSuccessState
//     ? Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Expanded(
//     child: Column(
//     children: [
//     Expanded(
//     child: Stack(
//     children: [
//     GridView.builder(
//     gridDelegate:
//     SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 1,
//     childAspectRatio: 3 / 1,
//     mainAxisSpacing: 8.h,
//     crossAxisSpacing: 8.w,
//     ),
//     itemCount: WishListViewModel.get(context).wishList!.length ,
//     itemBuilder: (context, index) {
//     return CustomeFavoriteItem(getData: WishListViewModel.get(context).wishList[index]);
//     })
//     ],
//     ),
//     ),
//     ],
//     ),
//     ),
//     ) :
//     Center(
//     child: CircularProgressIndicator(
//     color: ColorManager.primary,
//     ),
//     )
//     );
//     },
//     );

    return BlocBuilder<WishListViewModel, WishlistState>(
      bloc: WishListViewModel.get(context)
        ..addtoWishlistUseCase
        ..getWishlist()
        ..deleteItemInWishlistUseCase,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Product Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [
                InkWell(
                    onTap: () {}, child: Image.asset(IconAssets.searchIcon)),
                SizedBox(
                  width: 15.w,
                ),
                InkWell(onTap: () {}, child: Image.asset(IconAssets.cartIcon)),
              ],
            ),
            body: state is GetWishlistSuccessState
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 3 / 1,
                                      mainAxisSpacing: 8.h,
                                      crossAxisSpacing: 8.w,
                                    ),
                                    itemCount: WishListViewModel.get(context)
                                        .wishList!
                                        .length,
                                    itemBuilder: (context, index) {
                                      return CustomeFavoriteItem(
                                          getData:
                                              WishListViewModel.get(context)
                                                  .wishList![index]);
                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ));
      },
    );
  }
}
