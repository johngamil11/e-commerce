import 'package:ecommercee/core/routes_manager/routes.dart';
import 'package:ecommercee/feature/main_layout/home_screen/cubit/home_tab_view_model.dart';
import 'package:ecommercee/feature/main_layout/products/cubit/Product_states.dart';
import 'package:ecommercee/feature/main_layout/products/cubit/product_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/widget/custome_products_view.dart';
import '../../../core/widget/dialog_utils.dart';
import '../../../core/widget/search_app_bar.dart';
import '../../../domain/di/di.dart';
import 'Products_details/products_details.dart';

class Product extends StatelessWidget {
  // ProductScreenViewModel viewModel = getIt<ProductScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductScreenViewModel, ProductStates>(
      bloc: ProductScreenViewModel.get(context)..getAllProducts(),
      listener: (context, state) {
        if (state is ProductErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        } else if (state is ProductErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 95.h,
            actions: [
              SearchAppBar(),
            ],
          ),
          body: ProductScreenViewModel.get(context).productsList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2.h,
                      crossAxisSpacing: 8.w,
                      childAspectRatio: 8 / 12),
                  itemCount:
                      ProductScreenViewModel.get(context).productsList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    product: ProductScreenViewModel.get(context)
                                        .productsList[index],
                                  )));
                        },
                        child: CustomeProductsView(
                          product: ProductScreenViewModel.get(context)
                              .productsList[index],
                        ));
                  }),

          // CustomeProductsView()
        );
      },
    );
  }
}
