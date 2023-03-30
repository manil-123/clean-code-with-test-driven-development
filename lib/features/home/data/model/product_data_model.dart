import 'package:ecom_clean_code/core/constants/hive_config.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_data_model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeIds.productDataModel)
class ProductDataModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final num? price;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? category;
  @HiveField(5)
  final String? image;
  @HiveField(6)
  final RatingDataModel? rating;

  const ProductDataModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDataModelFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: HiveTypeIds.ratingDataModel)
class RatingDataModel {
  @HiveField(0)
  final num? rate;
  @HiveField(1)
  final int? count;
  const RatingDataModel({this.rate, this.count});

  factory RatingDataModel.fromJson(Map<String, dynamic> json) =>
      _$RatingDataModelFromJson(json);
}
