import 'package:dartz/dartz.dart';
import 'package:ecommercee/data/data_sources/remote_data-source/cart_remote_data_source.dart';
import 'package:ecommercee/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';
import 'package:ecommercee/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class GetCartRepositoryImp implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  GetCartRepositoryImp({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await cartRemoteDataSource.getCart();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId) async {
    var either = await cartRemoteDataSource.deleteItemInCart(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count) async {
    var either = await cartRemoteDataSource.updateCountInCart(productId, count);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
