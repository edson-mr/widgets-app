import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/widget_provider.dart';

enum TInvitados { all, completed, pending }

class StateScreen extends ConsumerWidget {
  const StateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listInvitados = ref.watch(filtradoInProvider);
    final filtrado = ref.watch(seleccionInvitadoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider + Providers'),
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text('Listado de Invitados'),
            subtitle: Text('Estas son las personas a invitar a la fiesta'),
          ),
          const SizedBox(height: 20),
          SegmentedButton(
            segments: const [
              ButtonSegment(
                value: TInvitados.all,
                label: Text('Todos'),
              ),
              ButtonSegment(
                value: TInvitados.completed,
                label: Text('Invitados'),
              ),
              ButtonSegment(
                value: TInvitados.pending,
                label: Text('No Invitados'),
              ),
            ],
            selected: <TInvitados>{filtrado},
            showSelectedIcon: false,
            onSelectionChanged: (value) {
              ref
                  .read(seleccionInvitadoProvider.notifier)
                  .changeFiltro(value.first);
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: listInvitados.length,
              itemBuilder: (context, index) {
                final invitado = listInvitados[index];
                return SwitchListTile(
                  value: invitado.done,
                  onChanged: (value) {
                    ref
                        .read(listaInvitadosProvider.notifier)
                        .toogleEstado(invitado.id);
                  },
                  title: Text(invitado.name),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(listaInvitadosProvider.notifier).crearInvitado();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
