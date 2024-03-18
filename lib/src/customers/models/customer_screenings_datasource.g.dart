// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_screenings_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customerScreeningsDataSourceHash() =>
    r'607ea8e7cef10cb2e97602e750913cd7ac8bc929';

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

/// See also [customerScreeningsDataSource].
@ProviderFor(customerScreeningsDataSource)
const customerScreeningsDataSourceProvider =
    CustomerScreeningsDataSourceFamily();

/// See also [customerScreeningsDataSource].
class CustomerScreeningsDataSourceFamily
    extends Family<Raw<CustomerScreeningsDataSource>> {
  /// See also [customerScreeningsDataSource].
  const CustomerScreeningsDataSourceFamily();

  /// See also [customerScreeningsDataSource].
  CustomerScreeningsDataSourceProvider call(
    List<CustomerWithRegistration> registrations,
  ) {
    return CustomerScreeningsDataSourceProvider(
      registrations,
    );
  }

  @override
  CustomerScreeningsDataSourceProvider getProviderOverride(
    covariant CustomerScreeningsDataSourceProvider provider,
  ) {
    return call(
      provider.registrations,
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
  String? get name => r'customerScreeningsDataSourceProvider';
}

/// See also [customerScreeningsDataSource].
class CustomerScreeningsDataSourceProvider
    extends AutoDisposeProvider<Raw<CustomerScreeningsDataSource>> {
  /// See also [customerScreeningsDataSource].
  CustomerScreeningsDataSourceProvider(
    List<CustomerWithRegistration> registrations,
  ) : this._internal(
          (ref) => customerScreeningsDataSource(
            ref as CustomerScreeningsDataSourceRef,
            registrations,
          ),
          from: customerScreeningsDataSourceProvider,
          name: r'customerScreeningsDataSourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$customerScreeningsDataSourceHash,
          dependencies: CustomerScreeningsDataSourceFamily._dependencies,
          allTransitiveDependencies:
              CustomerScreeningsDataSourceFamily._allTransitiveDependencies,
          registrations: registrations,
        );

  CustomerScreeningsDataSourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.registrations,
  }) : super.internal();

  final List<CustomerWithRegistration> registrations;

  @override
  Override overrideWith(
    Raw<CustomerScreeningsDataSource> Function(
            CustomerScreeningsDataSourceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CustomerScreeningsDataSourceProvider._internal(
        (ref) => create(ref as CustomerScreeningsDataSourceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        registrations: registrations,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Raw<CustomerScreeningsDataSource>>
      createElement() {
    return _CustomerScreeningsDataSourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerScreeningsDataSourceProvider &&
        other.registrations == registrations;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, registrations.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CustomerScreeningsDataSourceRef
    on AutoDisposeProviderRef<Raw<CustomerScreeningsDataSource>> {
  /// The parameter `registrations` of this provider.
  List<CustomerWithRegistration> get registrations;
}

class _CustomerScreeningsDataSourceProviderElement
    extends AutoDisposeProviderElement<Raw<CustomerScreeningsDataSource>>
    with CustomerScreeningsDataSourceRef {
  _CustomerScreeningsDataSourceProviderElement(super.provider);

  @override
  List<CustomerWithRegistration> get registrations =>
      (origin as CustomerScreeningsDataSourceProvider).registrations;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
