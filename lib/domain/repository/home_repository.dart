import 'package:dartz/dartz.dart';
import 'package:ecommercee/domain/failures.dart';

import '../entities/CategoryOrBrandResponseEntity.dart';
import '../entities/ProductResponseEntity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategory();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrand();

  Future<Either<Failures, ProductResponseEntity>> getAllProduct();
}
