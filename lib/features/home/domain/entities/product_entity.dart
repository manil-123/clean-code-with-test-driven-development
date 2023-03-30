class Product {
  final int? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
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

class Rating {
  final num? rate;
  final int? count;

  const Rating({this.rate, this.count});
}
