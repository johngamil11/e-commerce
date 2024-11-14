import 'package:dartz/dartz.dart';
import 'package:ecommercee/domain/entities/AddCartResponseEntity.dart';
import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';

import '../entities/CategoryOrBrandResponseEntity.dart';
import '../entities/ProductResponseEntity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategory();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrand();

  Future<Either<Failures, ProductResponseEntity>> getAllProduct();

  Future<Either<Failures, AddCartResponseEntity>> AddToCart(String productId);

  Future<Either<Failures, AddProductToWishlistEntity>> AddToWhishlist(
      String productId);

  Future<Either<Failures, GetWishlistResponseEntity>> GetWhishlist();
}
