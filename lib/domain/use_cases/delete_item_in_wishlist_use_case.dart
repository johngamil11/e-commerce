import 'package:dartz/dartz.dart';
import 'package:ecommercee/domain/entities/DeleteItemWishlistResponseEntity.dart';
import 'package:ecommercee/domain/repository/cart_repository.dart';
import 'package:ecommercee/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/GetCartResponseEntity.dart';
import '../failures.dart';

@injectable
class DeleteItemInWishlistUseCase {
  HomeRepository homeRepository;

  DeleteItemInWishlistUseCase({required this.homeRepository});

  Future<Either<Failures, DeleteItemWishlistResponseEntity>> invoke(
      String productId) {
    return homeRepository.DeleteItemWishlist(productId);
  }
}
