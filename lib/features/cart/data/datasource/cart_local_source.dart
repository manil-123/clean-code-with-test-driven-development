import 'package:ecom_clean_code/app/database/cart_dao.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CartLocalSource {
  final CartDao cartDao;

  CartLocalSource(this.cartDao);

  Future<bool> addToCart(Product product) async {
    final response = await cartDao.addToCart(product);
    if (!response) {
      throw CartException('Already in cart');
    }
    return response;
  }

  Future<bool> checkInCart(Product product) async {
    return await cartDao.contains(product);
  }

  Future<List<Product>> getProductsList() async {
    return await cartDao.getCartList();
  }
}
