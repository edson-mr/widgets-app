import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:widgets_app/config/helpers/name_information.dart';
import 'package:widgets_app/config/helpers/pokemon_information.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/domain/entities/invitados.dart';
import 'package:widgets_app/presentation/screens/state/state_screen.dart';

part 'widget_provider.g.dart';

const uuid = Uuid();

@Riverpod(keepAlive: true)
class Contador extends _$Contador {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

@Riverpod(keepAlive: true)
class Name extends _$Name {
  @override
  String build() {
    return 'Edson Mendoza Ramirez';
  }

  void changeName(String newName) {
    state = newName;
  }
}

@Riverpod(keepAlive: true)
class TemaGlobal extends _$TemaGlobal {
  @override
  AppTheme build() {
    return AppTheme();
  }

  void toogleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void selectedColor(int value) {
    state = state.copyWith(selectedColor: value);
  }
}

@Riverpod(keepAlive: true)
class IndexSelected extends _$IndexSelected {
  @override
  int build() {
    return 0;
  }

  void changeSelected(int value) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class ListaInvitados extends _$ListaInvitados {
  @override
  List<Invitados> build() {
    return [
      Invitados(
        id: uuid.v4(),
        name: 'Edson Mendoza Ramirez',
        completedAt: DateTime.now(),
      ),
      Invitados(
        id: uuid.v4(),
        name: 'Aldair Mendoza Ramirez',
      ),
    ];
  }

  void crearInvitado() {
    state = [
      ...state,
      Invitados(id: uuid.v4(), name: NameInformation.getName),
    ];
  }

  void toogleEstado(String id) {
    state = state.map((invitado) {
      if (invitado.id == id) {
        invitado = invitado.copywith(
            completedAt: invitado.done ? null : DateTime.now());
      }
      return invitado;
    }).toList();
  }
}

@Riverpod(keepAlive: true)
class SeleccionInvitado extends _$SeleccionInvitado {
  @override
  TInvitados build() {
    return TInvitados.all;
  }

  void changeFiltro(TInvitados newFiltro) {
    state = newFiltro;
  }
}

@Riverpod(keepAlive: true)
List<Invitados> filtradoIn(Ref ref) {
  final todos = ref.watch(listaInvitadosProvider);
  final filtro = ref.watch(seleccionInvitadoProvider);

  switch (filtro) {
    case TInvitados.all:
      return todos;
    case TInvitados.completed:
      return todos.where((element) => element.done).toList();
    case TInvitados.pending:
      return todos.where((element) => !element.done).toList();
  }
}

@Riverpod(keepAlive: true)
Future<String> getPokemon(Ref ref, int id) async {
  final name = await PokemonInformation.getPokemonName(id);
  return name;
}

@Riverpod(keepAlive: true)
Stream<List<String>> getListadoPersonas(Ref ref) async* {
  List<String> names = [];
  await for (final name in NameInformation.obtenerListado) {
    names.add(name);
    yield names;
  }
}
