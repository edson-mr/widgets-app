import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/contador/contador_screen.dart';
import 'package:widgets_app/presentation/screens/index.dart';
import 'package:widgets_app/presentation/screens/listado/listado_screen.dart';
import 'package:widgets_app/presentation/screens/pokemon/pokemon_screen.dart';
import 'package:widgets_app/presentation/screens/tema/tema_screen.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final IconData icon;
  final String url;
  final Widget screen;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.url,
    required this.screen,
  });
}

const List<MenuItems> menu = [
  MenuItems(
    title: 'Riverpod Counter',
    subTitle: 'introduccion a riverpod',
    icon: Icons.add,
    url: '/counter',
    screen: ContadorScreen(),
  ),
  MenuItems(
    title: 'Buttons',
    subTitle: 'Varios botones en Flutter',
    icon: Icons.burst_mode_outlined,
    url: '/buttons',
    screen: ButtonsScreen(),
  ),
  MenuItems(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    icon: Icons.card_giftcard,
    url: '/cards',
    screen: CardsScreen(),
  ),
  MenuItems(
    title: 'Progress Indicators',
    subTitle: 'Generales y Controlados',
    icon: Icons.refresh,
    url: '/indicators',
    screen: ProgressIndicatorScreen(),
  ),
  MenuItems(
    title: 'SnackBars y Diálogos',
    subTitle: 'indicadores en pantalla',
    icon: Icons.info_outline,
    url: '/dialogos',
    screen: DialogoScreen(),
  ),
  MenuItems(
    title: 'Animated Container',
    subTitle: 'Stateful Widget Animado',
    icon: Icons.confirmation_number,
    url: '/containers',
    screen: ContainerScreen(),
  ),
  MenuItems(
    title: 'UI Controls + Tile',
    subTitle: 'Una serie de controles de Flutter',
    icon: Icons.control_camera,
    url: '/controls',
    screen: ControlScreen(),
  ),
  MenuItems(
    title: 'Introducción a la aplicación',
    subTitle: 'Pequeño tutorial introductorio',
    icon: Icons.tungsten_outlined,
    url: '/tutorial',
    screen: SliderScreen(),
  ),
  MenuItems(
    title: 'InfiniteScroll y Pull',
    subTitle: 'Lista infinita y pull to refresh',
    icon: Icons.list,
    url: '/infinite',
    screen: ScrollScreen(),
  ),
  MenuItems(
    title: 'Cambiar Tema',
    subTitle: 'Cambiar tema de la aplicación',
    icon: Icons.local_pizza,
    url: '/temas',
    screen: TemaScreen(),
  ),
  MenuItems(
    title: 'State Provider + Provider',
    subTitle: 'TODO - una mezcla entre providers',
    icon: Icons.phone,
    url: '/todos',
    screen: StateScreen(),
  ),
  MenuItems(
    title: 'Pokemon state',
    subTitle: 'state provider pokemon',
    icon: Icons.podcasts,
    url: '/pokemon',
    screen: PokemonScreen(),
  ),
  MenuItems(
    title: 'Listado state',
    subTitle: 'state provider personas',
    icon: Icons.person,
    url: '/personas',
    screen: ListadoScreen(),
  ),
];
