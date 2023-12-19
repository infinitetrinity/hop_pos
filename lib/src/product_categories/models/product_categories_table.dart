import 'package:drift/drift.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';

@UseRowClass(ProductCategory)
class ProductCategoriesTable extends Table {
  @override
  String get tableName => 'product_categories';
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get description => text().nullable().withLength(max: 255)();
  TextColumn get colorCode => text().nullable().withLength(max: 255)();
}
