import 'package:ecommercee/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommercee/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:ecommercee/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommercee/feature/main_layout/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_cases/update_count_in_cart_use_case.dart';

@injectable
class CartScreenViewModel extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;

  DeleteItemInCartUseCase deleteItemInCartUseCase;

  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartScreenViewModel(
      {required this.updateCountInCartUseCase,
      required this.getCartUseCase,
      required this.deleteItemInCartUseCase})
      : super(CartInitialState());

  //todo : hold data - handle logic
  List<GetProductsCartEntity> productList = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(CartLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((error) => emit(CartErrorState(failures: error)), (response) {
      productList = response.data!.products!;
      emit(CartSuccessState(cartResponseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingState());
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((error) => emit(DeleteItemInCartErrorState(failures: error)),
        (response) {
      // productList = response.data!.products! ;
      emit(DeleteItemInCartSuccessState(cartResponseEntity: response));
    });
  }

  void updateItemCountInCar(String productId, int count) async {
    emit(updateItemCountInCartLoadingState());
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either
        .fold((error) => emit(updateItemCountInCartErrorState(failures: error)),
            (response) {
      // productList = response.data!.products! ;
      emit(updateItemCountInCartSuccessState(cartResponseEntity: response));
    });
  }
}
