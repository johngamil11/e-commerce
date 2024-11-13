import 'package:ecommercee/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  GetCartResponseEntity cartResponseEntity;

  CartSuccessState({required this.cartResponseEntity});
}

class CartErrorState extends CartStates {
  Failures failures;

  CartErrorState({required this.failures});
}

class DeleteItemInCartLoadingState extends CartStates {}

class DeleteItemInCartSuccessState extends CartStates {
  GetCartResponseEntity cartResponseEntity;

  DeleteItemInCartSuccessState({required this.cartResponseEntity});
}

class DeleteItemInCartErrorState extends CartStates {
  Failures failures;

  DeleteItemInCartErrorState({required this.failures});
}

class updateItemCountInCartLoadingState extends CartStates {}

class updateItemCountInCartSuccessState extends CartStates {
  GetCartResponseEntity cartResponseEntity;

  updateItemCountInCartSuccessState({required this.cartResponseEntity});
}

class updateItemCountInCartErrorState extends CartStates {
  Failures failures;

  updateItemCountInCartErrorState({required this.failures});
}
