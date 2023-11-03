import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/widget_provider.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temaGlobal = ref.watch(temaGlobalProvider);
    return MaterialApp.router(
      routerConfig: routerConfig,
      title: 'Widgets App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
              isDarkMode: temaGlobal.isDarkMode,
              selectedColor: temaGlobal.selectedColor)
          .getTheme(),
    );
  }
}
