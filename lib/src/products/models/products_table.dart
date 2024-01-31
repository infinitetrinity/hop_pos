import 'package:drift/drift.dart';
import 'package:hop_pos/src/product_categories/models/product_categories_table.dart';
import 'package:hop_pos/src/products/models/product.dart';

@TableIndex(name: 'products_id', columns: {#id}, unique: true)
@TableIndex(name: 'products_sku', columns: {#sku})
@TableIndex(name: 'products_category_id', columns: {#categoryId})
@UseRowClass(Product)
class ProductsTable extends Table {
  @override
  String get tableName => 'products';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get sku => text().withLength(max: 255)();
  RealColumn get price => real()();
  TextColumn get description => text().nullable().withLength(max: 255)();
  TextColumn get colorCode => text().nullable().withLength(max: 255)();
  IntColumn get categoryId =>
      integer().nullable().references(ProductCategoriesTable, #id, onDelete: KeyAction.setNull)();
}
