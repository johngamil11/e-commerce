import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommercee/core/resources/shared_preference_utils.dart';
import 'package:ecommercee/data/api_manager.dart';
import 'package:ecommercee/data/data_sources/remote_data-source/home_remote_data_source.dart';
import 'package:ecommercee/data/end_point.dart';
import 'package:ecommercee/data/model/AddCartResponseDto.dart';
import 'package:ecommercee/data/model/AddProductToWhishlistDto.dart';
import 'package:ecommercee/data/model/ProductResponseDto.dart';
import 'package:ecommercee/domain/entities/AddCartResponseEntity.dart';
import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';
import 'package:ecommercee/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommercee/domain/entities/ProductResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/widget/shared_preference_utils.dart';
import '../../../model/CategoryOrBrandResponseDto.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDaraSourceImp implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDaraSourceImp({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>>
      getAllCategories() async {
    apiManager.getData(EndPoint.getAllCategories);
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          EndPoint.getAllCategories,
        );

        var categoriesResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoriesResponse);
        } else {
          return Left(serverError(errorMessage: categoriesResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'no internet connection , please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          EndPoint.getAllBrands,
        );

        var brandsResponse = CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandsResponse);
        } else {
          return Left(serverError(errorMessage: brandsResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'no internet connection , please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDto>> getAllProduct() async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          EndPoint.getAllProduct,
        );

        var productResponse = ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(serverError(errorMessage: productResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'no internet connection , please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddCartResponseDto>> AddToCart(
      String productId) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.loadData('token');
        var response = await apiManager.postData(EndPoint.addToCart,
            body: {"productId": productId},
            headers: {'token': token.toString()});

        var addCartResponse = AddCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addCartResponse);
        } else if (response.statusCode == 401) {
          return Left(serverError(errorMessage: addCartResponse.message!));
        } else {
          return Left(serverError(errorMessage: addCartResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'no internet connection , please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddProductToWishlistDto>> AddtoWishlist(
      String productId) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.loadData('token');
        var response = await apiManager.postData(EndPoint.addToWishlist,
            body: {"productId": productId},
            headers: {'token': token.toString()});

        var addProductToWishlist =
            AddProductToWishlistDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addProductToWishlist);
        } else if (response.statusCode == 401) {
          return Left(serverError(errorMessage: addProductToWishlist.message!));
        } else {
          return Left(serverError(errorMessage: addProductToWishlist.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage: 'no internet connection , please try again'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
