import 'package:flutter/material.dart';

const List<Color> colores = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.pink,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0 && selectedColor < colores.length,
            'el color seleccionado está fuera de rango');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colores[selectedColor],
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
