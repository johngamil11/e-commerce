import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommercee/core/widget/shared_preference_utils.dart';
import 'package:ecommercee/data/api_manager.dart';
import 'package:ecommercee/data/data_sources/remote_data-source/cart_remote_data_source.dart';
import 'package:ecommercee/data/model/GetCartResponseDto.dart';
import 'package:ecommercee/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../end_point.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImp implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.loadData('token');
        var response = await apiManager
            .getData(EndPoint.getCart, headers: {'token': token.toString()});

        var getCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else if (response.statusCode == 401) {
          return Left(serverError(errorMessage: getCartResponse.message!));
        } else {
          return Left(serverError(errorMessage: getCartResponse.message!));
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
  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(
      String productId) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.loadData('token');
        var response = await apiManager.deleteData(
            '${EndPoint.getCart}/$productId',
            headers: {'token': token.toString()});

        var deleteItemInCartResponse =
            GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteItemInCartResponse);
        } else if (response.statusCode == 401) {
          return Left(
              serverError(errorMessage: deleteItemInCartResponse.message!));
        } else {
          return Left(
              serverError(errorMessage: deleteItemInCartResponse.message!));
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
  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(
      String productId, int count) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.loadData('token');
        var response = await apiManager.updateData(
            '${EndPoint.getCart}/$productId',
            body: {'count': '$count'},
            headers: {'token': token.toString()});

        var updateCountInCartResponse =
            GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(updateCountInCartResponse);
        } else if (response.statusCode == 401) {
          return Left(
              serverError(errorMessage: updateCountInCartResponse.message!));
        } else {
          return Left(
              serverError(errorMessage: updateCountInCartResponse.message!));
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
