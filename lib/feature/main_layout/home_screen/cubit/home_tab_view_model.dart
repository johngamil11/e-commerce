import 'package:ecommercee/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommercee/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommercee/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommercee/feature/main_layout/home_screen/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/assets_manager.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllGategoriesUseCase getAllGategoriesUseCase;

  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel(
      {required this.getAllGategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialStates());
  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];
  final List<String> AdsImages = [
    ImageAssets.slide1,
    ImageAssets.slide2,
    ImageAssets.slide3
  ];

  static HomeTabViewModel get(context) => BlocProvider.of(context);

  void getAllCategories() async {
    emit(HomeCategoryLoadingStates());
    var either = await getAllGategoriesUseCase.invoke();
    either.fold((error) {
      emit(HomeCategoryErrorStates(failures: error));
    }, (response) {
      categoriesList = response.data ?? [];
      if (brandsList.isNotEmpty) {
        emit(HomeCategorySuccessStates(categoryResponseEntity: response));
      }
    });
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingStates());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((error) {
      emit(HomeBrandsErrorStates(failures: error));
    }, (response) {
      brandsList = response.data ?? [];
      if (categoriesList.isNotEmpty) {
        emit(HomeBrandsSuccessStates(categoryResponseEntity: response));
      }
    });
  }
}
