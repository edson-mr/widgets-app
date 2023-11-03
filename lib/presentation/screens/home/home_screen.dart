import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/providers/widget_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          final menuItem = menu[index];
          return ListTile(
            title: Text(menuItem.title),
            subtitle: Text(menuItem.subTitle),
            leading: Icon(
              menuItem.icon,
              color: color.primary,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: color.primary,
            ),
            onTap: () {
              context.push(menuItem.url);
            },
          );
        },
      ),
      drawer: _CustomDrawer(scaffoldKey: scaffoldKey),
    );
  }
}

class _CustomDrawer extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const _CustomDrawer({required this.scaffoldKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTop = MediaQuery.of(context).viewPadding.top > 30;
    // int selectedIndex = 0;
    final selectedIndex = ref.watch(indexSelectedProvider);
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        ref.read(indexSelectedProvider.notifier).changeSelected(value);
        context.push(menu[value].url);
        scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(padding: EdgeInsets.only(top: isTop ? 0 : 30)),
        ...menu
            .map((item) => NavigationDrawerDestination(
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ))
            .toList()
      ],
    );
  }
}
