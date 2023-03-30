import 'package:ecom_clean_code/core/constants/hive_config.dart';
import 'package:hive/hive.dart';

part 'product_entity.g.dart';

@HiveType(typeId: HiveTypeIds.productDataModel)
class Product {
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
  final Rating? rating;

  const Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});
}

@HiveType(typeId: HiveTypeIds.ratingDataModel)
class Rating {
  @HiveField(0)
  final num? rate;
  @HiveField(1)
  final int? count;

  const Rating({this.rate, this.count});
}
