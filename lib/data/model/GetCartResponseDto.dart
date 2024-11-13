import 'package:ecommercee/data/model/CategoryOrBrandResponseDto.dart';
import 'package:ecommercee/data/model/ProductResponseDto.dart';
import 'package:ecommercee/domain/entities/GetCartResponseEntity.dart';

class GetCartResponseDto extends GetCartResponseEntity {
  GetCartResponseDto({
    super.status,
    super.numOfCartItems,
    super.cartId,
    this.statusMsg,
    this.message,
    super.data,
  });

  GetCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetDataCartDto.fromJson(json['data']) : null;
  }

  String? message;

  String? statusMsg;
}

class GetDataCartDto extends GetDataCartEntity {
  GetDataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetDataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetCartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetCartProductsDto extends GetProductsCartEntity {
  GetCartProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetCartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? GetCartProductDto.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class GetCartProductDto extends GetProductEntity {
  GetCartProductDto({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  GetCartProductDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryOrBrandResponseDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CategoryOrBrandResponseDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}
