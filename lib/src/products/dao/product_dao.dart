import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/product_categories/models/product_categories_table.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/products/models/product_with_category.dart';
import 'package:hop_pos/src/products/models/products_table.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [
  ProductsTable,
  ProductCategoriesTable,
])
class ProductDao extends DatabaseAccessor<AppDb> with _$ProductDaoMixin {
  ProductDao(AppDb db) : super(db);

  Future<List<ProductWithCategory>> getAllWithCategory() async {
    final query = select(productsTable).join(
      [
        leftOuterJoin(
          productCategoriesTable,
          productsTable.categoryId.equalsExp(
            productCategoriesTable.id,
          ),
        ),
      ],
    );

    query.orderBy([OrderingTerm.asc(productsTable.name)]);

    return (await query.get())
        .map((row) => ProductWithCategory(
              product: row.readTable(productsTable),
              category: row.readTable(productCategoriesTable),
            ))
        .toList();
  }

  Future<List<ProductWithCategory>> search(String search) async {
    final query = select(productsTable).join(
      [
        leftOuterJoin(
          productCategoriesTable,
          productsTable.categoryId.equalsExp(
            productCategoriesTable.id,
          ),
        ),
      ],
    );

    query.where(productsTable.name.like("%$search%") | productsTable.sku.like("%$search%"));
    query.orderBy([OrderingTerm.asc(productsTable.name)]);
    query.limit(20);

    return (await query.get())
        .map((row) => ProductWithCategory(
              product: row.readTable(productsTable),
              category: row.readTableOrNull(productCategoriesTable),
            ))
        .toList();
  }

  Future<Product> insertProduct(ProductsTableCompanion product) async {
    return await into(productsTable).insertReturning(product);
  }

  Future<List<Product>> insertProducts(List<ProductsTableCompanion> products) async {
    return await transaction(() async {
      List<Future<Product>> insertFutures = [];

      for (ProductsTableCompanion product in products) {
        insertFutures.add(insertProduct(product));
      }

      List<Product> result = await Future.wait(insertFutures);
      return result;
    });
  }
}
