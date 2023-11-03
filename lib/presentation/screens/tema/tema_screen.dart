import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/widget_provider.dart';

class TemaScreen extends ConsumerWidget {
  const TemaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(temaGlobalProvider).selectedColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('TemaScreen'),
      ),
      body: ListView.builder(
        itemCount: colores.length,
        itemBuilder: (context, index) {
          final color = colores[index];
          return RadioListTile(
            value: index,
            groupValue: selectedColor,
            onChanged: (value) {
              ref.read(temaGlobalProvider.notifier).selectedColor(value!);
            },
            activeColor: color,
            title: Text(
              'Este color',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('${color.value}'),
          );
        },
      ),
    );
  }
}
