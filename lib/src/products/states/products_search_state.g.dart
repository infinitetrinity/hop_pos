// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_search_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsSearchStateHash() =>
    r'1715be7b511f070d6abe289e8e2116fc9b322c1e';

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

/// See also [productsSearchState].
@ProviderFor(productsSearchState)
const productsSearchStateProvider = ProductsSearchStateFamily();

/// See also [productsSearchState].
class ProductsSearchStateFamily
    extends Family<AsyncValue<List<ProductWithCategory>>> {
  /// See also [productsSearchState].
  const ProductsSearchStateFamily();

  /// See also [productsSearchState].
  ProductsSearchStateProvider call(
    String search,
  ) {
    return ProductsSearchStateProvider(
      search,
    );
  }

  @override
  ProductsSearchStateProvider getProviderOverride(
    covariant ProductsSearchStateProvider provider,
  ) {
    return call(
      provider.search,
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
  String? get name => r'productsSearchStateProvider';
}

/// See also [productsSearchState].
class ProductsSearchStateProvider
    extends AutoDisposeFutureProvider<List<ProductWithCategory>> {
  /// See also [productsSearchState].
  ProductsSearchStateProvider(
    String search,
  ) : this._internal(
          (ref) => productsSearchState(
            ref as ProductsSearchStateRef,
            search,
          ),
          from: productsSearchStateProvider,
          name: r'productsSearchStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsSearchStateHash,
          dependencies: ProductsSearchStateFamily._dependencies,
          allTransitiveDependencies:
              ProductsSearchStateFamily._allTransitiveDependencies,
          search: search,
        );

  ProductsSearchStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
  }) : super.internal();

  final String search;

  @override
  Override overrideWith(
    FutureOr<List<ProductWithCategory>> Function(
            ProductsSearchStateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductsSearchStateProvider._internal(
        (ref) => create(ref as ProductsSearchStateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductWithCategory>> createElement() {
    return _ProductsSearchStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsSearchStateProvider && other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductsSearchStateRef
    on AutoDisposeFutureProviderRef<List<ProductWithCategory>> {
  /// The parameter `search` of this provider.
  String get search;
}

class _ProductsSearchStateProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductWithCategory>>
    with ProductsSearchStateRef {
  _ProductsSearchStateProviderElement(super.provider);

  @override
  String get search => (origin as ProductsSearchStateProvider).search;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
