import 'package:ecommercee/domain/entities/DeleteItemWishlistResponseEntity.dart';

class DeleteItemWishlistResponseDto extends DeleteItemWishlistResponseEntity {
  DeleteItemWishlistResponseDto({
    super.status,
    super.message,
    this.statusMsg,
    super.data,
  });

  DeleteItemWishlistResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String? statusMsg;
}
