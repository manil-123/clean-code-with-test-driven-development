// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDataModel _$ProductDataModelFromJson(Map<String, dynamic> json) =>
    ProductDataModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as num?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] == null
          ? null
          : RatingDataModel.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDataModelToJson(ProductDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };

RatingDataModel _$RatingDataModelFromJson(Map<String, dynamic> json) =>
    RatingDataModel(
      rate: json['rate'] as num?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$RatingDataModelToJson(RatingDataModel instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
