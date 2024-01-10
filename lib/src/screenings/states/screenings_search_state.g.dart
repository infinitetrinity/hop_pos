// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenings_search_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$screeningsSearchStateHash() =>
    r'b76238ff9841c181acd9ea6188a26acd9b46428b';

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

/// See also [screeningsSearchState].
@ProviderFor(screeningsSearchState)
const screeningsSearchStateProvider = ScreeningsSearchStateFamily();

/// See also [screeningsSearchState].
class ScreeningsSearchStateFamily extends Family<AsyncValue<List<Screening>>> {
  /// See also [screeningsSearchState].
  const ScreeningsSearchStateFamily();

  /// See also [screeningsSearchState].
  ScreeningsSearchStateProvider call(
    String search,
  ) {
    return ScreeningsSearchStateProvider(
      search,
    );
  }

  @override
  ScreeningsSearchStateProvider getProviderOverride(
    covariant ScreeningsSearchStateProvider provider,
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
  String? get name => r'screeningsSearchStateProvider';
}

/// See also [screeningsSearchState].
class ScreeningsSearchStateProvider
    extends AutoDisposeFutureProvider<List<Screening>> {
  /// See also [screeningsSearchState].
  ScreeningsSearchStateProvider(
    String search,
  ) : this._internal(
          (ref) => screeningsSearchState(
            ref as ScreeningsSearchStateRef,
            search,
          ),
          from: screeningsSearchStateProvider,
          name: r'screeningsSearchStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$screeningsSearchStateHash,
          dependencies: ScreeningsSearchStateFamily._dependencies,
          allTransitiveDependencies:
              ScreeningsSearchStateFamily._allTransitiveDependencies,
          search: search,
        );

  ScreeningsSearchStateProvider._internal(
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
    FutureOr<List<Screening>> Function(ScreeningsSearchStateRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScreeningsSearchStateProvider._internal(
        (ref) => create(ref as ScreeningsSearchStateRef),
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
  AutoDisposeFutureProviderElement<List<Screening>> createElement() {
    return _ScreeningsSearchStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScreeningsSearchStateProvider && other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ScreeningsSearchStateRef
    on AutoDisposeFutureProviderRef<List<Screening>> {
  /// The parameter `search` of this provider.
  String get search;
}

class _ScreeningsSearchStateProviderElement
    extends AutoDisposeFutureProviderElement<List<Screening>>
    with ScreeningsSearchStateRef {
  _ScreeningsSearchStateProviderElement(super.provider);

  @override
  String get search => (origin as ScreeningsSearchStateProvider).search;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
