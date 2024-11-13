import 'package:dartz/dartz.dart';
import 'package:ecommercee/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';

abstract class CartRepository {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
