class GetWishlistResponseEntity {
  GetWishlistResponseEntity({
    this.status,
    this.count,
    this.data,
  });


  String? status;
  num? count;
  List<GetWishlistDataEntity>? data;
}

class GetWishlistDataEntity {
  GetWishlistDataEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });


  num? sold;
  List<String>? images;
  List<GetWishlistSubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  GetWishlistCategoryEntity? category;
  dynamic brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? v;

}

class GetWishlistCategoryEntity {
  GetWishlistCategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });


  String? id;
  String? name;
  String? slug;
  String? image;

}

class GetWishlistSubcategoryEntity {
  GetWishlistSubcategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
  });


  String? id;
  String? name;
  String? slug;
  String? category;

}
