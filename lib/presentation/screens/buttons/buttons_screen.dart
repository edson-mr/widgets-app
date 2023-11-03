import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ButtonsScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text('Elevated Icon'),
                icon: const Icon(Icons.alarm),
              ),
              const ElevatedButton(
                onPressed: null,
                child: Text('Elevated'),
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('Filled'),
              ),
              FilledButton.icon(
                onPressed: () {},
                label: const Text('Filled'),
                icon: const Icon(Icons.person_off),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outline'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                label: const Text('Outline'),
                icon: const Icon(Icons.calculate),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Text'),
              ),
              TextButton.icon(
                onPressed: () {},
                label: const Text('Text'),
                icon: const Icon(Icons.ac_unit_sharp),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.accessible_forward_sharp),
              ),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.accessible_forward_sharp),
              ),
              const _CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {},
      child: Material(
        color: color.primary,
        borderRadius: BorderRadius.circular(20),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Custom',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
