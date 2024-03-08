// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_sales_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$screeningSalesDataSourceHash() =>
    r'7fd2f453f604aa531b6f4235b34d325a78a46fdd';

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

/// See also [screeningSalesDataSource].
@ProviderFor(screeningSalesDataSource)
const screeningSalesDataSourceProvider = ScreeningSalesDataSourceFamily();

/// See also [screeningSalesDataSource].
class ScreeningSalesDataSourceFamily
    extends Family<Raw<ScreeningSalesDataSource>> {
  /// See also [screeningSalesDataSource].
  const ScreeningSalesDataSourceFamily();

  /// See also [screeningSalesDataSource].
  ScreeningSalesDataSourceProvider call(
    Screening screening,
  ) {
    return ScreeningSalesDataSourceProvider(
      screening,
    );
  }

  @override
  ScreeningSalesDataSourceProvider getProviderOverride(
    covariant ScreeningSalesDataSourceProvider provider,
  ) {
    return call(
      provider.screening,
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
  String? get name => r'screeningSalesDataSourceProvider';
}

/// See also [screeningSalesDataSource].
class ScreeningSalesDataSourceProvider
    extends AutoDisposeProvider<Raw<ScreeningSalesDataSource>> {
  /// See also [screeningSalesDataSource].
  ScreeningSalesDataSourceProvider(
    Screening screening,
  ) : this._internal(
          (ref) => screeningSalesDataSource(
            ref as ScreeningSalesDataSourceRef,
            screening,
          ),
          from: screeningSalesDataSourceProvider,
          name: r'screeningSalesDataSourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$screeningSalesDataSourceHash,
          dependencies: ScreeningSalesDataSourceFamily._dependencies,
          allTransitiveDependencies:
              ScreeningSalesDataSourceFamily._allTransitiveDependencies,
          screening: screening,
        );

  ScreeningSalesDataSourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.screening,
  }) : super.internal();

  final Screening screening;

  @override
  Override overrideWith(
    Raw<ScreeningSalesDataSource> Function(ScreeningSalesDataSourceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScreeningSalesDataSourceProvider._internal(
        (ref) => create(ref as ScreeningSalesDataSourceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        screening: screening,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Raw<ScreeningSalesDataSource>> createElement() {
    return _ScreeningSalesDataSourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScreeningSalesDataSourceProvider &&
        other.screening == screening;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, screening.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ScreeningSalesDataSourceRef
    on AutoDisposeProviderRef<Raw<ScreeningSalesDataSource>> {
  /// The parameter `screening` of this provider.
  Screening get screening;
}

class _ScreeningSalesDataSourceProviderElement
    extends AutoDisposeProviderElement<Raw<ScreeningSalesDataSource>>
    with ScreeningSalesDataSourceRef {
  _ScreeningSalesDataSourceProviderElement(super.provider);

  @override
  Screening get screening =>
      (origin as ScreeningSalesDataSourceProvider).screening;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
