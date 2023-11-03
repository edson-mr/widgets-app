import 'package:flutter/material.dart';

enum Transportation { car, boat, plane, submarine }

class ControlScreen extends StatefulWidget {
  const ControlScreen({Key? key}) : super(key: key);

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  Transportation selectedTransport = Transportation.car;
  bool isDeveloper = false;
  bool isDesayuno = false;
  bool isAlmuerzo = false;
  bool isCena = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: isDeveloper,
            onChanged: (value) {
              isDeveloper = value;
              setState(() {});
            },
            title: const Text('Developer Mode'),
            subtitle: const Text('controles adicionales'),
          ),
          const Divider(),
          ExpansionTile(
            title: const Text('Vehiculo de transporte'),
            subtitle: Text('$selectedTransport'),
            children: [
              RadioListTile(
                value: Transportation.car,
                groupValue: selectedTransport,
                onChanged: (value) {
                  selectedTransport = value!;
                  setState(() {});
                },
                title: Text('By ${Transportation.car.name}'),
                subtitle: const Text('Viajar por carro'),
              ),
              RadioListTile(
                value: Transportation.boat,
                groupValue: selectedTransport,
                onChanged: (value) {
                  selectedTransport = value!;
                  setState(() {});
                },
                title: Text('By ${Transportation.boat.name}'),
                subtitle: const Text('Viajar por barco'),
              ),
              RadioListTile(
                value: Transportation.plane,
                groupValue: selectedTransport,
                onChanged: (value) {
                  selectedTransport = value!;
                  setState(() {});
                },
                title: Text('By ${Transportation.plane.name}'),
                subtitle: const Text('Viajar por avión'),
              ),
              RadioListTile(
                value: Transportation.submarine,
                groupValue: selectedTransport,
                onChanged: (value) {
                  selectedTransport = value!;
                  setState(() {});
                },
                title: Text('By ${Transportation.submarine.name}'),
                subtitle: const Text('Viajar por submarino'),
              ),
            ],
          ),
          const Divider(),
          CheckboxListTile(
            value: isDesayuno,
            onChanged: (value) {
              isDesayuno = !isDesayuno;
              setState(() {});
            },
            title: const Text('Desayuno?'),
          ),
          CheckboxListTile(
            value: isAlmuerzo,
            onChanged: (value) {
              isAlmuerzo = !isAlmuerzo;
              setState(() {});
            },
            title: const Text('Almuerzo?'),
          ),
          CheckboxListTile(
            value: isCena,
            onChanged: (value) {
              isCena = !isCena;
              setState(() {});
            },
            title: const Text('Cena?'),
          ),
        ],
      ),
    );
  }
}
