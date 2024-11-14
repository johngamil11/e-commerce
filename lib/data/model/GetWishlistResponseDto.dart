import 'package:ecommercee/domain/entities/GetWishlistResponseEntity.dart';

class GetWishlistResponseDto extends GetWishlistResponseEntity {
  GetWishlistResponseDto({
    super.status,
    super.count,
    this.message,
    this.statusMsg,
    super.data,
  });

  GetWishlistResponseDto.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetWishlistDataDto.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class GetWishlistDataDto extends GetWishlistDataEntity {
  GetWishlistDataDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  GetWishlistDataDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(GetWishlistSubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? GetWishlistCategoryDto.fromJson(json['category'])
        : null;
    brand = json['brand'];
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}

class GetWishlistCategoryDto extends GetWishlistCategoryEntity {
  GetWishlistCategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  GetWishlistCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class GetWishlistSubcategoryDto extends GetWishlistSubcategoryEntity {
  GetWishlistSubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  GetWishlistSubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
