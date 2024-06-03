import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/product_categories/models/product_categories_table.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:hop_pos/src/products/models/product_with_category.dart';

part 'product_category_dao.g.dart';

@DriftAccessor(tables: [ProductCategoriesTable])
class ProductCategoryDao extends DatabaseAccessor<AppDb> with _$ProductCategoryDaoMixin {
  ProductCategoryDao(AppDb db) : super(db);

  Future<List<ProductCategory>> getAll() {
    final query = select(productCategoriesTable);
    query.orderBy([(table) => OrderingTerm.asc(table.id)]);

    return query.get();
  }

  Future<ProductCategory> insertCategory(ProductCategoriesTableCompanion category) async {
    return await into(productCategoriesTable).insertReturning(category);
  }

  Future<List<ProductCategory>> insertCategories(List<ProductCategoriesTableCompanion> categories) async {
    return await transaction(() async {
      List<Future<ProductCategory>> insertFutures = [];

      for (ProductCategoriesTableCompanion category in categories) {
        insertFutures.add(insertCategory(category));
      }

      List<ProductCategory> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateCategory(ProductCategoriesTableCompanion category, Expression<bool> where) async {
    final count = await (update(productCategoriesTable)..where((_) => where)).write(category);
    return count > 0;
  }

  Future<bool> deleteById(int id) async {
    final count = await (delete(productCategoriesTable)..where((tbl) => tbl.id.equals(id))).go();
    return count > 0;
  }

  Future<void> insertOrUpdateMany(List<ProductCategory> categories) async {
    for (final category in categories) {
      await into(productCategoriesTable).insert(category.toData(), onConflict: DoUpdate((_) => category.toData()));
    }
  }

  Future<List<ProductWithCategory>> search(String search) async {
    final query = select(productCategoriesTable);
    query.where((table) => table.name.like("%$search%"));
    query.orderBy([(table) => OrderingTerm.asc(table.name)]);
    query.limit(20);

    return (await query.get())
        .map((row) => ProductWithCategory(
              product: null,
              category: row,
            ))
        .toList();
  }
}
