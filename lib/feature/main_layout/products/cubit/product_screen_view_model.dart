import 'package:ecommercee/domain/entities/ProductResponseEntity.dart';
import 'package:ecommercee/domain/use_cases/add_cart_use_case.dart';
import 'package:ecommercee/domain/use_cases/get_all_product_use_case.dart';
import 'package:ecommercee/feature/main_layout/products/cubit/Product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductScreenViewModel extends Cubit<ProductStates> {
  GetAllProductUseCase getAllProductUseCase;
  AddCartUseCase addCartUseCase;

  ProductScreenViewModel(
      {required this.getAllProductUseCase, required this.addCartUseCase})
      : super(ProductInitialState());

  // todo hold data - handle logic
  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;

  static ProductScreenViewModel get(context) =>
      BlocProvider.of<ProductScreenViewModel>(context);

  void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductUseCase.invoke();
    either.fold((error) => emit(ProductErrorState(failures: error)),
        (response) {
      productsList = response.data!;
      emit(ProductSuccessState(productResponseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addCartUseCase.invoke(productId);
    either.fold((error) {
      print('error : ${error.errorMessage}');
      emit(AddToCartErrorState(failures: error));
    }, (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      print('num of catr items : $numOfCartItems');
      emit(AddToCartSuccessState(addCartResponseEntity: response));
      numOfCartItems = numOfCartItems;
    });
  }
}
