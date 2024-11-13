import 'package:ecommercee/domain/entities/AddProductToWishlistEntity.dart';

class AddProductToWishlistDto extends AddProductToWishlistEntity {
  AddProductToWishlistDto({
    super.status,
    super.message,
    super.data,
  });

  AddProductToWishlistDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String? statusMsg;
}
