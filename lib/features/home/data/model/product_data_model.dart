import 'package:json_annotation/json_annotation.dart';

part 'product_data_model.g.dart';

@JsonSerializable()
class ProductDataModel {
  final int? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
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
class RatingDataModel {
  final num? rate;
  final int? count;
  const RatingDataModel({this.rate, this.count});

  factory RatingDataModel.fromJson(Map<String, dynamic> json) =>
      _$RatingDataModelFromJson(json);
}
