import 'package:dartz/dartz.dart';
import 'package:ecommercee/data/data_sources/remote_data-source/home_remote_data_source.dart';
import 'package:ecommercee/domain/entities/AddCartResponseEntity.dart';
import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommercee/domain/entities/DeleteItemWishlistResponseEntity.dart';
import 'package:ecommercee/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommercee/domain/entities/ProductResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';
import 'package:ecommercee/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImp({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getAllCategory() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrand() async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProduct() async {
    var either = await homeRemoteDataSource.getAllProduct();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> AddToCart(
      String productId) async {
    var either = await homeRemoteDataSource.AddToCart(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddProductToWishlistEntity>> AddToWhishlist(
      String productId) async {
    var either = await homeRemoteDataSource.AddtoWishlist(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetWishlistResponseEntity>> GetWhishlist() async {
    var either = await homeRemoteDataSource.GetWishlist();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  Future<Either<Failures, DeleteItemWishlistResponseEntity>> DeleteItemWishlist(
      String productId) async {
    var either = await homeRemoteDataSource.DeleteItemWishlst(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}

