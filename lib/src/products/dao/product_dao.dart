import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:hop_pos/src/products/models/products_table.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [ProductsTable])
class ProductDao extends DatabaseAccessor<AppDb> with _$ProductDaoMixin {
  ProductDao(AppDb db) : super(db);

  Future<Product> insertProduct(ProductsTableCompanion product) async {
    return await into(productsTable).insertReturning(product);
  }

  Future<List<Product>> insertProducts(
      List<ProductsTableCompanion> products) async {
    return await transaction(() async {
      List<Future<Product>> insertFutures = [];

      for (ProductsTableCompanion product in products) {
        insertFutures.add(insertProduct(product));
      }

      List<Product> result = await Future.wait(insertFutures);
      return result;
    });
  }

  Future<bool> updateProduct(
      ProductsTableCompanion product, Expression<bool> where) async {
    final count =
        await (update(productsTable)..where((_) => where)).write(product);
    return count > 0;
  }
}
