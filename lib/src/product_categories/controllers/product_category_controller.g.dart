// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productCategoryControllerHash() =>
    r'1a5bca6c3ae946d2524eadf91c3a6aa535bf39d9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ProductCategoryController
    extends BuildlessAutoDisposeAsyncNotifier<List<ProductCategory>> {
  late final bool showHidden;

  FutureOr<List<ProductCategory>> build({
    bool showHidden = false,
  });
}

/// See also [ProductCategoryController].
@ProviderFor(ProductCategoryController)
const productCategoryControllerProvider = ProductCategoryControllerFamily();

/// See also [ProductCategoryController].
class ProductCategoryControllerFamily
    extends Family<AsyncValue<List<ProductCategory>>> {
  /// See also [ProductCategoryController].
  const ProductCategoryControllerFamily();

  /// See also [ProductCategoryController].
  ProductCategoryControllerProvider call({
    bool showHidden = false,
  }) {
    return ProductCategoryControllerProvider(
      showHidden: showHidden,
    );
  }

  @override
  ProductCategoryControllerProvider getProviderOverride(
    covariant ProductCategoryControllerProvider provider,
  ) {
    return call(
      showHidden: provider.showHidden,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productCategoryControllerProvider';
}

/// See also [ProductCategoryController].
class ProductCategoryControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductCategoryController,
        List<ProductCategory>> {
  /// See also [ProductCategoryController].
  ProductCategoryControllerProvider({
    bool showHidden = false,
  }) : this._internal(
          () => ProductCategoryController()..showHidden = showHidden,
          from: productCategoryControllerProvider,
          name: r'productCategoryControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productCategoryControllerHash,
          dependencies: ProductCategoryControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductCategoryControllerFamily._allTransitiveDependencies,
          showHidden: showHidden,
        );

  ProductCategoryControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.showHidden,
  }) : super.internal();

  final bool showHidden;

  @override
  FutureOr<List<ProductCategory>> runNotifierBuild(
    covariant ProductCategoryController notifier,
  ) {
    return notifier.build(
      showHidden: showHidden,
    );
  }

  @override
  Override overrideWith(ProductCategoryController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductCategoryControllerProvider._internal(
        () => create()..showHidden = showHidden,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        showHidden: showHidden,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductCategoryController,
      List<ProductCategory>> createElement() {
    return _ProductCategoryControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductCategoryControllerProvider &&
        other.showHidden == showHidden;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, showHidden.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductCategoryControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<ProductCategory>> {
  /// The parameter `showHidden` of this provider.
  bool get showHidden;
}

class _ProductCategoryControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductCategoryController,
        List<ProductCategory>> with ProductCategoryControllerRef {
  _ProductCategoryControllerProviderElement(super.provider);

  @override
  bool get showHidden =>
      (origin as ProductCategoryControllerProvider).showHidden;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
