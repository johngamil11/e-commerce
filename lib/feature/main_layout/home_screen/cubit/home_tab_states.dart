import 'package:ecommercee/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';

abstract class HomeTabStates {}

class HomeTabInitialStates extends HomeTabStates {}

class HomeCategoryLoadingStates extends HomeTabStates {}

class HomeCategoryErrorStates extends HomeTabStates {
  Failures failures;

  HomeCategoryErrorStates({required this.failures});
}

class HomeCategorySuccessStates extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryResponseEntity;

  HomeCategorySuccessStates({required this.categoryResponseEntity});
}

class HomeBrandsLoadingStates extends HomeTabStates {}

class HomeBrandsErrorStates extends HomeTabStates {
  Failures failures;

  HomeBrandsErrorStates({required this.failures});
}

class HomeBrandsSuccessStates extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryResponseEntity;

  HomeBrandsSuccessStates({required this.categoryResponseEntity});
}
