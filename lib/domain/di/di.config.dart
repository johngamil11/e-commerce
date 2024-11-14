// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/widget/custome_favorite_item.dart' as _i752;
import '../../data/api_manager.dart' as _i236;
import '../../data/data_sources/remote_data-source/auth_remote_data_source.dart'
    as _i728;
import '../../data/data_sources/remote_data-source/cart_remote_data_source.dart'
    as _i410;
import '../../data/data_sources/remote_data-source/home_remote_data_source.dart'
    as _i839;
import '../../data/data_sources/remote_data-source/imp/auth_remote_data_source_imp.dart'
    as _i282;
import '../../data/data_sources/remote_data-source/imp/cart_remote_data_source_imp.dart'
    as _i977;
import '../../data/data_sources/remote_data-source/imp/home_remote_data_source_imp.dart'
    as _i641;
import '../../data/repository/authRepositoryImp.dart' as _i295;
import '../../data/repository/get_cart_repository_imp.dart' as _i1003;
import '../../data/repository/home_repository_imp.dart' as _i434;
import '../../feature/auth/login/cubit/login_view_model.dart' as _i473;
import '../../feature/auth/register/cubit/register_view_model.dart' as _i139;
import '../../feature/main_layout/cart/cubit/cart_screen_view_model.dart'
    as _i64;
import '../../feature/main_layout/favorite_tab/cubit/wishlist_view_model.dart'
    as _i533;
import '../../feature/main_layout/home_screen/cubit/home_tab_view_model.dart'
    as _i474;
import '../../feature/main_layout/products/cubit/product_screen_view_model.dart'
    as _i84;
import '../entities/GetWishlistResponseEntity.dart' as _i957;
import '../repository/auth_repository.dart' as _i106;
import '../repository/cart_repository.dart' as _i900;
import '../repository/home_repository.dart' as _i326;
import '../use_cases/add_cart_use_case.dart' as _i424;
import '../use_cases/add_to_wishlist_use_case.dart' as _i74;
import '../use_cases/delete_item_in_cart_use_case.dart' as _i723;
import '../use_cases/delete_item_in_wishlist_use_case.dart' as _i876;
import '../use_cases/get_all_brands_use_case.dart' as _i59;
import '../use_cases/get_all_categories_use_case.dart' as _i924;
import '../use_cases/get_all_product_use_case.dart' as _i382;
import '../use_cases/get_cart_use_case.dart' as _i220;
import '../use_cases/Get_wishlist_use_case.dart' as _i252;
import '../use_cases/login_use_case.dart' as _i119;
import '../use_cases/register_use_case.dart' as _i526;
import '../use_cases/update_count_in_cart_use_case.dart' as _i786;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i236.ApiManager>(() => _i236.ApiManager());
    gh.factory<_i728.AuthRemoteDataSource>(() =>
        _i282.AuthRemoteDataSourceImp(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i410.CartRemoteDataSource>(() =>
        _i977.CartRemoteDataSourceImp(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i752.CustomeFavoriteItem>(() =>
        _i752.CustomeFavoriteItem(getData: gh<_i957.GetWishlistDataEntity>()));
    gh.factory<_i839.HomeRemoteDataSource>(() =>
        _i641.HomeRemoteDaraSourceImp(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i900.CartRepository>(() => _i1003.GetCartRepositoryImp(
        cartRemoteDataSource: gh<_i410.CartRemoteDataSource>()));
    gh.factory<_i106.AuthRepository>(() => _i295.Authrepositoryimp(
        authRemoteDataSource: gh<_i728.AuthRemoteDataSource>()));
    gh.factory<_i119.LoginUseCase>(
        () => _i119.LoginUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i526.RegisterUseCase>(() =>
        _i526.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i326.HomeRepository>(() => _i434.HomeRepositoryImp(
        homeRemoteDataSource: gh<_i839.HomeRemoteDataSource>()));
    gh.factory<_i220.GetCartUseCase>(
        () => _i220.GetCartUseCase(cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i723.DeleteItemInCartUseCase>(() =>
        _i723.DeleteItemInCartUseCase(
            cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i786.UpdateCountInCartUseCase>(() =>
        _i786.UpdateCountInCartUseCase(
            cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i139.RegisterViewModel>(() =>
        _i139.RegisterViewModel(registerUseCase: gh<_i526.RegisterUseCase>()));
    gh.factory<_i473.LoginViewModel>(
        () => _i473.LoginViewModel(loginUseCase: gh<_i119.LoginUseCase>()));
    gh.factory<_i64.CartScreenViewModel>(() => _i64.CartScreenViewModel(
          updateCountInCartUseCase: gh<_i786.UpdateCountInCartUseCase>(),
          getCartUseCase: gh<_i220.GetCartUseCase>(),
          deleteItemInCartUseCase: gh<_i723.DeleteItemInCartUseCase>(),
        ));
    gh.factory<_i424.AddCartUseCase>(
        () => _i424.AddCartUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i59.GetAllBrandsUseCase>(() =>
        _i59.GetAllBrandsUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i924.GetAllGategoriesUseCase>(() =>
        _i924.GetAllGategoriesUseCase(
            homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i382.GetAllProductUseCase>(() =>
        _i382.GetAllProductUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i74.AddtoWishlistUseCase>(() =>
        _i74.AddtoWishlistUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i252.GetWishlistUseCase>(() =>
        _i252.GetWishlistUseCase(homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i876.DeleteItemInWishlistUseCase>(() =>
        _i876.DeleteItemInWishlistUseCase(
            homeRepository: gh<_i326.HomeRepository>()));
    gh.factory<_i474.HomeTabViewModel>(() => _i474.HomeTabViewModel(
          getAllGategoriesUseCase: gh<_i924.GetAllGategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i59.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i84.ProductScreenViewModel>(() => _i84.ProductScreenViewModel(
          getAllProductUseCase: gh<_i382.GetAllProductUseCase>(),
          addCartUseCase: gh<_i424.AddCartUseCase>(),
        ));
    gh.factory<_i533.WishListViewModel>(() => _i533.WishListViewModel(
          addtoWishlistUseCase: gh<_i74.AddtoWishlistUseCase>(),
          getWishlistUseCase: gh<_i252.GetWishlistUseCase>(),
          deleteItemInWishlistUseCase: gh<_i876.DeleteItemInWishlistUseCase>(),
        ));
    return this;
  }
}
