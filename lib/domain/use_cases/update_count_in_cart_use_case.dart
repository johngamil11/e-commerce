import 'package:dartz/dartz.dart';
import 'package:ecommercee/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/GetCartResponseEntity.dart';
import '../failures.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepository cartRepository;

  UpdateCountInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return cartRepository.updateCountInCart(productId, count);
  }
}
