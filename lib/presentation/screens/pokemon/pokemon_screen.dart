import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/widget_provider.dart';

class PokemonScreen extends ConsumerStatefulWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  PokemonScreenState createState() => PokemonScreenState();
}

class PokemonScreenState extends ConsumerState<PokemonScreen> {
  int pokemonId = 1;
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(getPokemonProvider(pokemonId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Screen'),
      ),
      body: Center(
        child: name.when(
          data: (data) => Text(data),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'uno',
            onPressed: () {
              pokemonId++;
              setState(() {});
            },
            child: const Icon(Icons.next_plan_outlined),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              if (pokemonId > 1) {
                pokemonId--;
                setState(() {});
              }
            },
            child: const Icon(Icons.skip_previous),
          ),
        ],
      ),
    );
  }
}
