import 'package:dartz/dartz.dart';
import 'package:ecommercee/domain/entities/AddCartResponseEntity.dart';
import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommercee/domain/entities/DeleteItemWishlistResponseEntity.dart';
import 'package:ecommercee/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommercee/domain/entities/ProductResponseEntity.dart';

import '../../../domain/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProduct();

  Future<Either<Failures, AddCartResponseEntity>> AddToCart(String productId);

  Future<Either<Failures, AddProductToWishlistEntity>> AddtoWishlist(
      String productId);

  Future<Either<Failures, GetWishlistResponseEntity>> GetWishlist();

  Future<Either<Failures, DeleteItemWishlistResponseEntity>> DeleteItemWishlst(
      String productId);
}
