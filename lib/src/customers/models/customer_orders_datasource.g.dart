// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_orders_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customerOrdersDataSourceHash() =>
    r'e5c1ee0d49f106e3438987b486b0babf59bc9eb5';

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

/// See also [customerOrdersDataSource].
@ProviderFor(customerOrdersDataSource)
const customerOrdersDataSourceProvider = CustomerOrdersDataSourceFamily();

/// See also [customerOrdersDataSource].
class CustomerOrdersDataSourceFamily
    extends Family<Raw<CustomerOrdersDataSource>> {
  /// See also [customerOrdersDataSource].
  const CustomerOrdersDataSourceFamily();

  /// See also [customerOrdersDataSource].
  CustomerOrdersDataSourceProvider call(
    List<OrderWithCustomerAndPayment> orders,
  ) {
    return CustomerOrdersDataSourceProvider(
      orders,
    );
  }

  @override
  CustomerOrdersDataSourceProvider getProviderOverride(
    covariant CustomerOrdersDataSourceProvider provider,
  ) {
    return call(
      provider.orders,
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
  String? get name => r'customerOrdersDataSourceProvider';
}

/// See also [customerOrdersDataSource].
class CustomerOrdersDataSourceProvider
    extends AutoDisposeProvider<Raw<CustomerOrdersDataSource>> {
  /// See also [customerOrdersDataSource].
  CustomerOrdersDataSourceProvider(
    List<OrderWithCustomerAndPayment> orders,
  ) : this._internal(
          (ref) => customerOrdersDataSource(
            ref as CustomerOrdersDataSourceRef,
            orders,
          ),
          from: customerOrdersDataSourceProvider,
          name: r'customerOrdersDataSourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$customerOrdersDataSourceHash,
          dependencies: CustomerOrdersDataSourceFamily._dependencies,
          allTransitiveDependencies:
              CustomerOrdersDataSourceFamily._allTransitiveDependencies,
          orders: orders,
        );

  CustomerOrdersDataSourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orders,
  }) : super.internal();

  final List<OrderWithCustomerAndPayment> orders;

  @override
  Override overrideWith(
    Raw<CustomerOrdersDataSource> Function(CustomerOrdersDataSourceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CustomerOrdersDataSourceProvider._internal(
        (ref) => create(ref as CustomerOrdersDataSourceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orders: orders,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Raw<CustomerOrdersDataSource>> createElement() {
    return _CustomerOrdersDataSourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerOrdersDataSourceProvider && other.orders == orders;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orders.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CustomerOrdersDataSourceRef
    on AutoDisposeProviderRef<Raw<CustomerOrdersDataSource>> {
  /// The parameter `orders` of this provider.
  List<OrderWithCustomerAndPayment> get orders;
}

class _CustomerOrdersDataSourceProviderElement
    extends AutoDisposeProviderElement<Raw<CustomerOrdersDataSource>>
    with CustomerOrdersDataSourceRef {
  _CustomerOrdersDataSourceProviderElement(super.provider);

  @override
  List<OrderWithCustomerAndPayment> get orders =>
      (origin as CustomerOrdersDataSourceProvider).orders;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
