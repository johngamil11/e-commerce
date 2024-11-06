import 'package:ecommercee/core/resources/color_manager.dart';
import 'package:ecommercee/core/widget/CustomeSectionBar.dart';
import 'package:ecommercee/core/widget/custome_slider.dart';
import 'package:ecommercee/domain/di/di.dart';
import 'package:ecommercee/feature/main_layout/home_screen/cubit/home_tab_states.dart';
import 'package:ecommercee/feature/main_layout/home_screen/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widget/custome_category.dart';
import '../../../core/widget/custome_category_brands.dart';
import '../../../core/widget/search_app_bar.dart';
class HomeScreen extends StatelessWidget {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: HomeTabViewModel.get(context)
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 95.h,
            actions: [
              SearchAppBar(),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomeSlider(),
                SizedBox(
                  height: 20.h,
                ),
                CustomeSectionBar(title: 'Categories', function: () {}),
                state is HomeCategoryLoadingStates
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        ),
                      )
                    : SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: HomeTabViewModel.get(context)
                                .categoriesList
                                .length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return CustomeCategory(
                                list: HomeTabViewModel.get(context)
                                    .categoriesList[index],
                              );
                            }),
                      ),

                CustomeSectionBar(title: 'Brands', function: () {}),
                state is HomeBrandsLoadingStates
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        ),
                      )
                    : SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                HomeTabViewModel.get(context).brandsList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return CustomeCategoryBrands(
                                brandList: HomeTabViewModel.get(context)
                                    .brandsList[index],
                              );
                            }),
                      ),
                //todo: grid view
              ],
            ),
          ),
        );
      },
    );
  }
}
