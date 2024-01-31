import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';

class ProductCategoriesOrder {
  static const _key = "categoriesOrder";
  static const _storage = FlutterSecureStorage();

  static Future<void> reorderCategories(int oldIndex, int newIndex) async {
    final categories = await getCategoriesOrder();
    if (categories == null) {
      return;
    }

    int itemToMove = categories.removeAt(oldIndex);
    categories.insert(newIndex, itemToMove);
    await _storage.write(key: _key, value: categories.join(','));
  }

  static Future<void> setCategoriesOrder(
      List<ProductCategory>? categories) async {
    await _storage.delete(key: _key);
    await _storage.write(
        key: _key, value: categories?.map((e) => e.id).join(','));
  }

  static Future<List<int>?> getCategoriesOrder() async {
    String? ids = await _storage.read(key: _key);
    return ids?.split(',').map(int.parse).toList();
  }
}
