import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/domain/entities/GetWishlistResponseEntity.dart';
import 'package:ecommercee/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:ecommercee/feature/main_layout/favorite_tab/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/ProductResponseEntity.dart';
import '../../../../domain/use_cases/Get_wishlist_use_case.dart';

@injectable
class WishListViewModel extends Cubit<WishlistState> {
  AddtoWishlistUseCase addtoWishlistUseCase;
  GetWishlistUseCase getWishlistUseCase;

  WishListViewModel(
      {required this.addtoWishlistUseCase, required this.getWishlistUseCase})
      : super(WishlistStateInitialState());

  List<GetWishlistDataEntity>? wishList;
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

  void getWishlist() async {
    // List<GetWishlistDataEntity>? wishList;
    emit(GetWishlistLoadingState());
    var either = await getWishlistUseCase.invoke();
    // print('response : $either');
    either.fold((error) => emit(GetWishlistErrorState(failures: error)),
        (response) {
      wishList = response.data;
      // print(response.data);
      emit(GetWishlistSuccessState(product: response.data!.toList()));
    });
  }
}
