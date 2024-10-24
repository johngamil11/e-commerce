import 'package:dartz/dartz.dart';
import 'package:ecommercee/domain/entities/LoginResponseEntity.dart';
import 'package:ecommercee/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommercee/domain/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String emil, String password, String rePassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
    String emil,
    String password,
  );
}
