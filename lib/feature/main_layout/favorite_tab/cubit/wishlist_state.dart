import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';

import '../../../../domain/failures.dart';

abstract class WishlistState {}

class WishlistStateInitialState extends WishlistState {}

class WishlistStateLoadingState extends WishlistState {}

class WishlistStateSuccessState extends WishlistState {
  AddProductToWishlistEntity addProductToWishlistEntity;

  WishlistStateSuccessState({required this.addProductToWishlistEntity});
}

class WishlistStateErrorState extends WishlistState {
  Failures failures;

  WishlistStateErrorState({required this.failures});
}
