import 'package:dartz/dartz.dart';
import 'package:ecommercee/domain/entities/AddCartResponseEntity.dart';
import 'package:ecommercee/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommercee/domain/entities/LoginResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';
import 'package:ecommercee/domain/repository/auth_repository.dart';
import 'package:ecommercee/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/RegisterResponseEntity.dart';

@injectable
class AddCartUseCase {
  HomeRepository homeRepository;

  AddCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddCartResponseEntity>> invoke(String productId) {
    return homeRepository.AddToCart(productId);
  }
}
