import 'package:random_name_generator/random_name_generator.dart';

class NameInformation {
  static String get getName {
    final name = RandomNames(Zone.spain);
    return name.fullName();
  }

  static Stream<String> get obtenerListado {
    return Stream.periodic(const Duration(seconds: 2), (contador) {
      return getName;
    }).take(10);
  }
}
