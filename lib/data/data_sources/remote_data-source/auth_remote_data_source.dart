import 'package:dartz/dartz.dart';
import 'package:ecommercee/domain/entities/LoginResponseEntity.dart';
import '../../../domain/entities/RegisterResponseEntity.dart';
import '../../../domain/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String emil, String password, String rePassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
    String emil,
    String password,
  );
}
