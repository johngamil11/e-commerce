import 'package:ecommercee/data/model/RegisterResponseDto.dart';
import 'package:ecommercee/domain/entities/LoginResponseEntity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
    super.message,
    super.user,
    this.statusMsg,
    super.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? statusMsg;
}
