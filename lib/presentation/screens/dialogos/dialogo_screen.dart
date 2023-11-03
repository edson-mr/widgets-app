import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DialogoScreen extends StatelessWidget {
  const DialogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Ullamco nostrud officia nulla Lorem id nisi ullamco reprehenderit enim sint esse laborum irure voluptate. Do ullamco adipisicing anim culpa fugiat sit. Laborum nulla sit elit adipisicing est.'),
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('¿Estás seguro?'),
                    content: const Text(
                        'Adipisicing aute id cupidatat sit aute enim quis qui aliqua cillum adipisicing. Consectetur nisi velit enim amet pariatur irure amet in culpa irure. Deserunt incididunt commodo ad deserunt reprehenderit Lorem sunt sint eiusmod veniam culpa ut.'),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text('Cancelar'),
                      ),
                      FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Aceptar'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Mostrar Diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 3),
              content: const Text('Hola mundo'),
              action: SnackBarAction(label: 'Ok!', onPressed: () {}),
            ),
          );
        },
        label: const Text('Mostrar SnackBar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
