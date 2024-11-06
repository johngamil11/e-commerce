import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommercee/data/api_manager.dart';
import 'package:ecommercee/data/data_sources/remote_data-source/auth_remote_data_source.dart';
import 'package:ecommercee/data/end_point.dart';
import 'package:ecommercee/data/model/LoginResponseDto.dart';
import 'package:ecommercee/data/model/RegisterResponseDto.dart';
import 'package:ecommercee/domain/entities/LoginResponseEntity.dart';
import 'package:ecommercee/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String emil, String password, String rePassword, String phone) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.postData(EndPoint.register, body: {
          "name": name,
          "email": emil,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(serverError(errorMessage: registerResponse.message!));
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
  Future<Either<Failures, LoginResponseDto>> login(
      String emil, String password) async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.postData(EndPoint.login, body: {
          "email": emil,
          "password": password,
        });
        var loginResponse = LoginResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(serverError(errorMessage: loginResponse.message!));
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
