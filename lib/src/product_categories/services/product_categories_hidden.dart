import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hop_pos/app/app_extension.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';

class ProductCategoriesHidden {
  static const _key = "categoriesHidden";
  static const _storage = FlutterSecureStorage();

  static Future<List<int>?> getHiddenCategories() async {
    String? ids = await _storage.read(key: _key);
    return ids?.split(',').map(int.parse).toList();
  }

  static Future<void> toggleCategory(ProductCategory category) async {
    final ids = await getHiddenCategories();
    if (ids == null || !ids.contains(category.id)) {
      await hideCategory(category);
      return;
    }

    await unhideCategory(category);
  }

  static Future<void> hideCategory(ProductCategory category) async {
    final ids = await getHiddenCategories();
    await _storage.write(
        key: _key, value: [...ids ?? [], category.id].join(','));
  }

  static Future<void> unhideCategory(ProductCategory category) async {
    final ids = await getHiddenCategories();
    ids?.remove(category.id);
    await _storage.write(
        key: _key,
        value: ids?.join(',').isNullOrEmpty == true ? null : ids?.join(','));
  }
}
