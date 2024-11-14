import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommercee/domain/entities/ProductResponseEntity.dart';

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

class GetWishlistLoadingState extends WishlistState {}

class GetWishlistSuccessState extends WishlistState {
// GetWishlistDataEntity getWishlistResponseEntity ;
  List<GetWishlistDataEntity> product;

  GetWishlistSuccessState({required this.product
      // required this.getWishlistResponseEntity
      });
}

class GetWishlistErrorState extends WishlistState {
  Failures failures;

  GetWishlistErrorState({required this.failures});
}
