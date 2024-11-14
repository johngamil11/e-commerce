import 'package:dartz/dartz.dart';
import 'package:ecommercee/domain/entities/AddCartResponseEntity.dart';
import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommercee/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommercee/domain/entities/LoginResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';
import 'package:ecommercee/domain/repository/auth_repository.dart';
import 'package:ecommercee/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/RegisterResponseEntity.dart';

@injectable
class GetWishlistUseCase {
  HomeRepository homeRepository;

  GetWishlistUseCase({required this.homeRepository});

  Future<Either<Failures, GetWishlistResponseEntity>> invoke() {
    return homeRepository.GetWhishlist();
  }
}
