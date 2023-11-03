import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/helpers/name_information.dart';
import 'package:widgets_app/presentation/providers/widget_provider.dart';

class ContadorScreen extends ConsumerWidget {
  const ContadorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contador = ref.watch(contadorProvider);
    final name = ref.watch(nameProvider);
    // final darkMode = ref.watch(darkModeProvider);
    final darkMode = ref.watch(temaGlobalProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(temaGlobalProvider.notifier).toogleDarkMode();
            },
            icon: Icon(darkMode
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Valor: $contador',
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'fab-1',
            onPressed: () {
              ref.read(contadorProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 15),
          FloatingActionButton.extended(
            onPressed: () {
              ref
                  .read(nameProvider.notifier)
                  .changeName(NameInformation.getName);
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Nombre aleatorio'),
          ),
        ],
      ),
    );
  }
}
