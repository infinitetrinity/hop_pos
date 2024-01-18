import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';

class ProductCategoriesOrder {
  static const _key = "categoriesOrder";
  static const _storage = FlutterSecureStorage();

  static Future<void> setCategoriesOrder(List<ProductCategory> categories) async {
    final ids = categories.map((e) => e.id).toList();
    await _storage.write(key: _key, value: ids.join(','));
  }

  static Future<List<int>?> getCategoriesOrder() async {
    String? ids = await _storage.read(key: _key);
    return ids?.split(',').map(int.parse).toList();
  }

  static Future<void> deleteCategoriesOrder() async {
    await _storage.delete(key: _key);
  }
}
