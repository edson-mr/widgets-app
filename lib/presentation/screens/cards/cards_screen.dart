import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<double> elevations = [0, 1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: ListView(
        children: [
          ...elevations.map((e) => _CardType1(e)).toList(),
          ...elevations.map((e) => _CardType2(e)).toList(),
          ...elevations.map((e) => _CardType3(e)).toList(),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final double e;
  const _CardType1(this.e);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: e,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text('elevation $e'),
            ),
          )
        ],
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final double e;
  const _CardType2(this.e);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Card(
      elevation: e,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color.outline),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text('elevation $e'),
            ),
          )
        ],
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final double e;
  const _CardType3(this.e);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: e,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${e.toInt() + 1}/200/300',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
