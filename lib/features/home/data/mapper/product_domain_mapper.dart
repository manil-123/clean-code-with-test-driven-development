import 'package:ecom_clean_code/features/home/data/model/product_data_model.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDomainMapper {
  Product fromProductModel(ProductDataModel model);
  Rating fromRatingModel(RatingDataModel model);
}

@LazySingleton(as: ProductDomainMapper)
class ProductDomainMapperImpl extends ProductDomainMapper {
  ProductDomainMapperImpl() : super();

  @override
  Product fromProductModel(ProductDataModel model) {
    final product = Product(
      id: model.id,
      title: model.title,
      price: model.price,
      description: model.description,
      category: model.category,
      image: model.image,
      rating: model.rating == null ? null : fromRatingModel(model.rating!),
    );
    return product;
  }

  @override
  Rating fromRatingModel(RatingDataModel model) {
    final rating = Rating(
      rate: model.rate,
      count: model.count,
    );
    return rating;
  }
}
