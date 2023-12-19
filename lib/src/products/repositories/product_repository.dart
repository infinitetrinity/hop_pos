import 'package:drift/drift.dart';
import 'package:hop_pos/app/app_db.dart';
import 'package:hop_pos/src/products/dao/product_dao.dart';
import 'package:hop_pos/src/products/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

@riverpod
ProductRepository productRepo(ProductRepoRef ref) {
  return ProductRepository(
    productDao: ref.watch(appDbProvider.select((prov) => prov.productDao)),
  );
}

class ProductRepository {
  final ProductDao productDao;

  ProductRepository({
    required this.productDao,
  });

  Future<Product> insert(ProductsTableCompanion product) async {
    return await productDao.insertProduct(product);
  }

  Future<List<Product>> insertMany(
      List<ProductsTableCompanion> products) async {
    return await productDao.insertProducts(products);
  }

  Future<bool> update(
      ProductsTableCompanion product, Expression<bool> where) async {
    return await productDao.updateProduct(product, where);
  }
}
