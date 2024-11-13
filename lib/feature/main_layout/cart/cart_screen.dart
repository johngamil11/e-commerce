import 'package:ecommercee/feature/main_layout/cart/cubit/cart_screen_view_model.dart';
import 'package:ecommercee/feature/main_layout/cart/cubit/cart_states.dart';
import 'package:ecommercee/feature/main_layout/cart/widget/custome_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenViewModel, CartStates>(
      bloc: CartScreenViewModel.get(context)..getCart(),
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
            body: state is CartSuccessState
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
                                    itemCount: state.cartResponseEntity.data!
                                        .products!.length,
                                    itemBuilder: (context, index) {
                                      return CustomeItemCart(
                                        productEntity: state.cartResponseEntity
                                            .data!.products![index],
                                      );
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
                                      style: TextStyle(
                                          color: ColorManager.grey,
                                          fontSize: 20),
                                    ),
                                    Text(
                                        state.cartResponseEntity.data!
                                            .totalCartPrice
                                            .toString(),
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
                                    Text(
                                      'Check Out',
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: 18),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_right_alt),
                                      color: ColorManager.white,
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
            ) :
            Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            )
        );
      },
    );
  }
}
