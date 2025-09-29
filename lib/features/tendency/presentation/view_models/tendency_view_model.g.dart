// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tendency_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tendencyViewModelHash() => r'b11b3ac277b3c29dbedcab16291763e8baec1035';

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

abstract class _$TendencyViewModel
    extends BuildlessAutoDisposeNotifier<TendencyPageState> {
  late final BuildContext context;

  TendencyPageState build(BuildContext context);
}

/// See also [TendencyViewModel].
@ProviderFor(TendencyViewModel)
const tendencyViewModelProvider = TendencyViewModelFamily();

/// See also [TendencyViewModel].
class TendencyViewModelFamily extends Family<TendencyPageState> {
  /// See also [TendencyViewModel].
  const TendencyViewModelFamily();

  /// See also [TendencyViewModel].
  TendencyViewModelProvider call(BuildContext context) {
    return TendencyViewModelProvider(context);
  }

  @override
  TendencyViewModelProvider getProviderOverride(
    covariant TendencyViewModelProvider provider,
  ) {
    return call(provider.context);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tendencyViewModelProvider';
}

/// See also [TendencyViewModel].
class TendencyViewModelProvider
    extends
        AutoDisposeNotifierProviderImpl<TendencyViewModel, TendencyPageState> {
  /// See also [TendencyViewModel].
  TendencyViewModelProvider(BuildContext context)
    : this._internal(
        () => TendencyViewModel()..context = context,
        from: tendencyViewModelProvider,
        name: r'tendencyViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$tendencyViewModelHash,
        dependencies: TendencyViewModelFamily._dependencies,
        allTransitiveDependencies:
            TendencyViewModelFamily._allTransitiveDependencies,
        context: context,
      );

  TendencyViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  TendencyPageState runNotifierBuild(covariant TendencyViewModel notifier) {
    return notifier.build(context);
  }

  @override
  Override overrideWith(TendencyViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: TendencyViewModelProvider._internal(
        () => create()..context = context,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TendencyViewModel, TendencyPageState>
  createElement() {
    return _TendencyViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TendencyViewModelProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TendencyViewModelRef
    on AutoDisposeNotifierProviderRef<TendencyPageState> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _TendencyViewModelProviderElement
    extends
        AutoDisposeNotifierProviderElement<TendencyViewModel, TendencyPageState>
    with TendencyViewModelRef {
  _TendencyViewModelProviderElement(super.provider);

  @override
  BuildContext get context => (origin as TendencyViewModelProvider).context;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
