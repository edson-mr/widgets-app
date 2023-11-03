import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/widget_provider.dart';

class ListadoScreen extends StatelessWidget {
  const ListadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListadoScreen'),
      ),
      body: const StreamView(),
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listado = ref.watch(getListadoPersonasProvider);

    if (listado.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (listado.hasError) {
      return Center(
        child: Text('${listado.error}'),
      );
    }
    final users = listado.value!;
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(title: Text(user));
      },
    );
  }
}
