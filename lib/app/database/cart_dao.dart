import 'package:ecom_clean_code/core/constants/hive_config.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CartDao {
  static const int _cartListKey = 0;
  final Future<Box<List<Product>>> _cartListBox =
      Hive.openBox(HiveBoxNames.cartListBox);

  List<Product> _productsInCart = [];

  Future<bool> addToCart(Product product) async {
    final box = await _cartListBox;
    final cartList = box.get(_cartListKey, defaultValue: <Product>[]);
    _productsInCart = cartList!;
    if (!_productsInCart.contains(product)) {
      _productsInCart.add(product);
      box.put(_cartListKey, _productsInCart);
      return true;
    } else {
      throw CartException('Already in cart');
    }
  }

  Future<bool> isInCart(Product product) async {
    final box = await _cartListBox;
    final cartList = box.get(_cartListKey, defaultValue: <Product>[]);
    _productsInCart = cartList!;
    if (_productsInCart.contains(product)) {
      return true;
    } else {
      return false;
    }
  }
}
