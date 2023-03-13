import 'package:ecom_clean_code/features/categories/domain/entity/category.dart';

class CategoryResponse {
  final List<CategoryDataModel> categoriesList;

  CategoryResponse(this.categoriesList);

  factory CategoryResponse.fromList(List<dynamic> data) {
    var categoriesList = <CategoryDataModel>[];
    for (var category in data) {
      categoriesList.add(
        CategoryDataModel(categoryName: category as String),
      );
    }
    return CategoryResponse(categoriesList);
  }
}

class CategoryDataModel extends Category {
  const CategoryDataModel({required String categoryName})
      : super(categoryName: categoryName);
}
