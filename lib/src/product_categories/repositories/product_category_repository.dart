import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/product_categories/daos/product_category_dao.dart';
import 'package:hop_pos/src/product_categories/models/product_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_category_repository.g.dart';

@riverpod
ProductCategoryRepository productCategoryRepo(ProductCategoryRepoRef ref) {
  return ProductCategoryRepository(
    productCategoryDao: ref.watch(appDbProvider.select((prov) => prov.productCategoryDao)),
  );
}

class ProductCategoryRepository {
  final ProductCategoryDao productCategoryDao;

  ProductCategoryRepository({
    required this.productCategoryDao,
  });

  Future<List<ProductCategory>> getAll() {
    return productCategoryDao.getAll();
  }

  Future<ProductCategory> insert(ProductCategoriesTableCompanion category) async {
    return await productCategoryDao.insertCategory(category);
  }

  Future<List<ProductCategory>> insertMany(List<ProductCategoriesTableCompanion> categories) async {
    return await productCategoryDao.insertCategories(categories);
  }

  Future<bool> update(ProductCategoriesTableCompanion category, Expression<bool> where) async {
    return await productCategoryDao.updateCategory(category, where);
  }

  Future<bool> deleteById(int id) async {
    return productCategoryDao.deleteById(id);
  }
}
