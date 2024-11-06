import 'package:dartz/dartz.dart';
import 'package:ecommercee/data/data_sources/remote_data-source/home_remote_data_source.dart';
import 'package:ecommercee/domain/entities/CategoryOrBrandResponseEntity.dart';
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
}
