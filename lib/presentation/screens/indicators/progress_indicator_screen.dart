import 'package:flutter/material.dart';

class ProgressIndicatorScreen extends StatelessWidget {
  const ProgressIndicatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Circular Progress Indicator'),
            const SizedBox(height: 15),
            const CircularProgressIndicator(
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 15),
            const Text('Circular y Linear Controlado'),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: StreamBuilder<double>(
                  stream: Stream.periodic(
                    const Duration(milliseconds: 300),
                    (value) => value / 100,
                  ).takeWhile((element) => element <= 1),
                  builder: (context, snapshot) {
                    final value = snapshot.data ?? 0;
                    return Row(
                      children: [
                        CircularProgressIndicator(
                          value: value,
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: LinearProgressIndicator(
                            value: value,
                          ),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
