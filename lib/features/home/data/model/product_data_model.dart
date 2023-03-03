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
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
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
    return RatingDataModel(rate: json['rate'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
