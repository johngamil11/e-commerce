import 'package:dartz/dartz.dart';
import 'package:ecommercee/data/data_sources/remote_data-source/auth_remote_data_source.dart';
import 'package:ecommercee/domain/entities/LoginResponseEntity.dart';
import 'package:ecommercee/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';
import 'package:ecommercee/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class Authrepositoryimp implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  Authrepositoryimp({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String emil, String password, String rePassword, String phone) async {
    var either = await authRemoteDataSource.register(
        name, emil, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String emil, String password) async {
    var either = await authRemoteDataSource.login(emil, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
