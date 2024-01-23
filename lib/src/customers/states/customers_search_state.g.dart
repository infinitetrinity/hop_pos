// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_search_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customersSearchStateHash() =>
    r'a7a412e6a9adbd54f795648c2f853d6f04faec55';

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

/// See also [customersSearchState].
@ProviderFor(customersSearchState)
const customersSearchStateProvider = CustomersSearchStateFamily();

/// See also [customersSearchState].
class CustomersSearchStateFamily
    extends Family<AsyncValue<List<CustomerWithRegistration>>> {
  /// See also [customersSearchState].
  const CustomersSearchStateFamily();

  /// See also [customersSearchState].
  CustomersSearchStateProvider call(
    String search,
  ) {
    return CustomersSearchStateProvider(
      search,
    );
  }

  @override
  CustomersSearchStateProvider getProviderOverride(
    covariant CustomersSearchStateProvider provider,
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
  String? get name => r'customersSearchStateProvider';
}

/// See also [customersSearchState].
class CustomersSearchStateProvider
    extends AutoDisposeFutureProvider<List<CustomerWithRegistration>> {
  /// See also [customersSearchState].
  CustomersSearchStateProvider(
    String search,
  ) : this._internal(
          (ref) => customersSearchState(
            ref as CustomersSearchStateRef,
            search,
          ),
          from: customersSearchStateProvider,
          name: r'customersSearchStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$customersSearchStateHash,
          dependencies: CustomersSearchStateFamily._dependencies,
          allTransitiveDependencies:
              CustomersSearchStateFamily._allTransitiveDependencies,
          search: search,
        );

  CustomersSearchStateProvider._internal(
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
    FutureOr<List<CustomerWithRegistration>> Function(
            CustomersSearchStateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CustomersSearchStateProvider._internal(
        (ref) => create(ref as CustomersSearchStateRef),
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
  AutoDisposeFutureProviderElement<List<CustomerWithRegistration>>
      createElement() {
    return _CustomersSearchStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomersSearchStateProvider && other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CustomersSearchStateRef
    on AutoDisposeFutureProviderRef<List<CustomerWithRegistration>> {
  /// The parameter `search` of this provider.
  String get search;
}

class _CustomersSearchStateProviderElement
    extends AutoDisposeFutureProviderElement<List<CustomerWithRegistration>>
    with CustomersSearchStateRef {
  _CustomersSearchStateProviderElement(super.provider);

  @override
  String get search => (origin as CustomersSearchStateProvider).search;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
