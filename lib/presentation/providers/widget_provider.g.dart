// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filtradoInHash() => r'36156155d07fb01cc75062ae61903b5abeb7996e';

/// See also [filtradoIn].
@ProviderFor(filtradoIn)
final filtradoInProvider = Provider<List<Invitados>>.internal(
  filtradoIn,
  name: r'filtradoInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$filtradoInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FiltradoInRef = ProviderRef<List<Invitados>>;
String _$getPokemonHash() => r'8406df789a1f128fad9def679dabd0d711f87b05';

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

/// See also [getPokemon].
@ProviderFor(getPokemon)
const getPokemonProvider = GetPokemonFamily();

/// See also [getPokemon].
class GetPokemonFamily extends Family<AsyncValue<String>> {
  /// See also [getPokemon].
  const GetPokemonFamily();

  /// See also [getPokemon].
  GetPokemonProvider call(
    int id,
  ) {
    return GetPokemonProvider(
      id,
    );
  }

  @override
  GetPokemonProvider getProviderOverride(
    covariant GetPokemonProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getPokemonProvider';
}

/// See also [getPokemon].
class GetPokemonProvider extends FutureProvider<String> {
  /// See also [getPokemon].
  GetPokemonProvider(
    int id,
  ) : this._internal(
          (ref) => getPokemon(
            ref as GetPokemonRef,
            id,
          ),
          from: getPokemonProvider,
          name: r'getPokemonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPokemonHash,
          dependencies: GetPokemonFamily._dependencies,
          allTransitiveDependencies:
              GetPokemonFamily._allTransitiveDependencies,
          id: id,
        );

  GetPokemonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<String> Function(GetPokemonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPokemonProvider._internal(
        (ref) => create(ref as GetPokemonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<String> createElement() {
    return _GetPokemonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPokemonProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPokemonRef on FutureProviderRef<String> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetPokemonProviderElement extends FutureProviderElement<String>
    with GetPokemonRef {
  _GetPokemonProviderElement(super.provider);

  @override
  int get id => (origin as GetPokemonProvider).id;
}

String _$getListadoPersonasHash() =>
    r'f678bde84e83eb8bbd50f5166d4c3874e9be73ba';

/// See also [getListadoPersonas].
@ProviderFor(getListadoPersonas)
final getListadoPersonasProvider = StreamProvider<List<String>>.internal(
  getListadoPersonas,
  name: r'getListadoPersonasProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getListadoPersonasHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetListadoPersonasRef = StreamProviderRef<List<String>>;
String _$contadorHash() => r'553367e31fadbb11c5d170ba166c475afae28fd9';

/// See also [Contador].
@ProviderFor(Contador)
final contadorProvider = NotifierProvider<Contador, int>.internal(
  Contador.new,
  name: r'contadorProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$contadorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Contador = Notifier<int>;
String _$nameHash() => r'3dd44403f0a6bf3b8ffb904f0e15e148c3d4536c';

/// See also [Name].
@ProviderFor(Name)
final nameProvider = NotifierProvider<Name, String>.internal(
  Name.new,
  name: r'nameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Name = Notifier<String>;
String _$temaGlobalHash() => r'db7d49d8aec09dd6b783d138e67faeacd8c4e0b3';

/// See also [TemaGlobal].
@ProviderFor(TemaGlobal)
final temaGlobalProvider = NotifierProvider<TemaGlobal, AppTheme>.internal(
  TemaGlobal.new,
  name: r'temaGlobalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$temaGlobalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TemaGlobal = Notifier<AppTheme>;
String _$indexSelectedHash() => r'cf0f6bc6889b342f4353a74d442c4766cac2f946';

/// See also [IndexSelected].
@ProviderFor(IndexSelected)
final indexSelectedProvider = NotifierProvider<IndexSelected, int>.internal(
  IndexSelected.new,
  name: r'indexSelectedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$indexSelectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IndexSelected = Notifier<int>;
String _$listaInvitadosHash() => r'4bfb0543dffc716cd95e93271445b1e9dec3209a';

/// See also [ListaInvitados].
@ProviderFor(ListaInvitados)
final listaInvitadosProvider =
    NotifierProvider<ListaInvitados, List<Invitados>>.internal(
  ListaInvitados.new,
  name: r'listaInvitadosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listaInvitadosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListaInvitados = Notifier<List<Invitados>>;
String _$seleccionInvitadoHash() => r'8750b281162c2d6fa4e5e4b3abfd9ba4e7c5cbb9';

/// See also [SeleccionInvitado].
@ProviderFor(SeleccionInvitado)
final seleccionInvitadoProvider =
    NotifierProvider<SeleccionInvitado, TInvitados>.internal(
  SeleccionInvitado.new,
  name: r'seleccionInvitadoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$seleccionInvitadoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SeleccionInvitado = Notifier<TInvitados>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
