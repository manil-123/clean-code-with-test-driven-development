import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/core/data/base_remote_data_source.dart';
import 'package:ecom_clean_code/core/data/json_decoder.dart';
import 'package:ecom_clean_code/features/categories/data/model/category_data_model.dart';

class CategoryRemoteDataSource extends BaseRemoteDataSourceImpl {
  CategoryRemoteDataSource(super.client, super.sharedPreferences);

  Future<List<CategoryDataModel>> getCategoriesList() async {
    final response = await performGetRequest(ApiEndpoints.categoriesUrl);
    final data = jsonDecodeAndHandleException(response);
    return CategoryResponse.fromList(data).categoriesList;
  }
}
