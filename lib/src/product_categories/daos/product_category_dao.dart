import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/product_categories/models/product_categories_table.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';

part 'product_category_dao.g.dart';

@DriftAccessor(tables: [ProductCategoriesTable])
class ProductCategoryDao extends DatabaseAccessor<AppDb>
    with _$ProductCategoryDaoMixin {
  ProductCategoryDao(AppDb db) : super(db);

  Future<ProductCategory> insertCategory(
      ProductCategoriesTableCompanion category) async {
    return await into(productCategoriesTable).insertReturning(category);
  }

  Future<List<ProductCategory>> insertCategories(
      List<ProductCategoriesTableCompanion> categories) async {
    return await transaction(() async {
      List<Future<ProductCategory>> insertFutures = [];

      for (ProductCategoriesTableCompanion category in categories) {
        insertFutures.add(insertCategory(category));
      }

      List<ProductCategory> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateCategory(
      ProductCategoriesTableCompanion category, Expression<bool> where) async {
    final count = await (update(productCategoriesTable)..where((_) => where))
        .write(category);
    return count > 0;
  }
}