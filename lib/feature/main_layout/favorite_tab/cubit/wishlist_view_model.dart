import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:ecommercee/feature/main_layout/favorite_tab/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishListViewModel extends Cubit<WishlistState> {
  AddtoWishlistUseCase addtoWishlistUseCase;

  WishListViewModel({required this.addtoWishlistUseCase})
      : super(WishlistStateInitialState());

  static WishListViewModel get(context) => BlocProvider.of(context);

  void addToWishlist(String productId) async {
    emit(WishlistStateLoadingState());
    var either = await addtoWishlistUseCase.invoke(productId);
    either.fold((error) => emit(WishlistStateErrorState(failures: error)),
        (response) {
      print('Added to wishlist Successfully');
      emit(WishlistStateSuccessState(addProductToWishlistEntity: response));
    });
  }
}
