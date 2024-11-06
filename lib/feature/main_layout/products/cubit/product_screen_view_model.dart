import 'package:ecommercee/domain/entities/ProductResponseEntity.dart';
import 'package:ecommercee/domain/use_cases/get_all_product_use_case.dart';
import 'package:ecommercee/feature/main_layout/products/cubit/Product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductScreenViewModel extends Cubit<ProductStates> {
  GetAllProductUseCase getAllProductUseCase;

  ProductScreenViewModel({required this.getAllProductUseCase})
      : super(ProductInitialState());

  // todo hold data - handle logic
  List<ProductEntity> productsList = [];

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
}
