import 'dart:convert';

import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:ecom_clean_code/core/data/base_remote_data_source.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:ecom_clean_code/features/home/data/model/product_data_model.dart';

class ProductsRemoteDataSource extends BaseRemoteDataSourceImpl {
  ProductsRemoteDataSource(super.client, super.sharedPreferences);

  Future<List<ProductDataModel>> getProducts(String category) async {
    final response = await performGetRequest(
      category.isEmpty
          ? ApiEndpoints.getProductsUrl
          : ApiEndpoints.getProductsUrl + category,
    );
    if (response.statusCode == 200) {
      final responseList = jsonDecode(response.body) as List<dynamic>;
      var productsList = <ProductDataModel>[];
      for (var product in responseList) {
        productsList
            .add(ProductDataModel.fromJson(product as Map<String, dynamic>));
      }
      return productsList;
    } else {
      throw ServerException(ErrorMessage.serverFailureMessage);
    }
  }
}
