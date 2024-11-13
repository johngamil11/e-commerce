import 'package:ecommercee/domain/entities/AddCartResponseEntity.dart';
import 'package:ecommercee/domain/entities/ProductResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}
class ProductLoadingState extends ProductStates {}
class ProductErrorState extends ProductStates {
  Failures failures;

  ProductErrorState({required this.failures});
}
class ProductSuccessState extends ProductStates {
  ProductResponseEntity productResponseEntity;

  ProductSuccessState({required this.productResponseEntity});
}

class AddToCartLoadingState extends ProductStates {}

class AddToCartErrorState extends ProductStates {
  Failures failures;

  AddToCartErrorState({required this.failures});
}

class AddToCartSuccessState extends ProductStates {
  AddCartResponseEntity addCartResponseEntity;

  AddToCartSuccessState({required this.addCartResponseEntity});
}
