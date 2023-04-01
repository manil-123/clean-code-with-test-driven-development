import 'dart:developer';

import 'package:ecom_clean_code/core/constants/hive_config.dart';
import 'package:ecom_clean_code/core/error/exceptions.dart';
import 'package:ecom_clean_code/features/home/domain/entities/product_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CartDao {
  final Future<Box<Product>> _cartListBox =
      Hive.openBox(HiveBoxNames.cartListBox);

  Future<bool> addToCart(Product product) async {
    final box = await _cartListBox;
    try {
      box.put(product.id, product);
      return true;
    } catch (e) {
      throw CartException('Add to cart exception');
    }
  }

  Future<bool> contains(Product product) async {
    final box = await _cartListBox;
    return box.containsKey(product.id);
  }

  Future<List<Product>> getCartList() async {
    final box = await _cartListBox;

    return box.values.toList();
  }
}
