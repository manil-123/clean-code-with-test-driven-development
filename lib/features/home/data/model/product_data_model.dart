import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';

class ProductDataModel extends Product {
  const ProductDataModel(
      {id, title, price, description, category, image, rating})
      : super(
            id: id,
            title: title,
            price: price,
            description: description,
            category: category,
            image: image,
            rating: rating);

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as num,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: json['rating'] != null
          ? RatingDataModel.fromJson(json['rating'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!;
    }
    return data;
  }
}

class RatingDataModel extends Rating {
  const RatingDataModel({rate, count}) : super(rate: rate, count: count);

  factory RatingDataModel.fromJson(Map<String, dynamic> json) {
    return RatingDataModel(rate: json['rate'] as num, count: json['count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
