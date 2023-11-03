import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/index.dart';

final routerConfig = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  ...menu
      .map(
        (item) => GoRoute(
          path: item.url,
          builder: (context, state) => item.screen,
        ),
      )
      .toList(),
]);
