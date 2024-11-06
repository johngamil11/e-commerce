import 'package:ecommercee/domain/entities/CategoryOrBrandResponseEntity.dart';

class CategoryOrBrandResponseDto extends CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseDto({
    super.results,
    super.metadata,
    this.message,
    this.statusMsg,
    super.data,
  });

  CategoryOrBrandResponseDto.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDto.fromJson(v));
      });
    }
  }

  String? statusMsg;

  String? message;
}

class CategoryDto extends CategoryOrBrandEntity {
  CategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}

class Metadata extends MetadataEntity {
  Metadata({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
