import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({Key? key}) : super(key: key);

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  double width = 100;
  double height = 100;
  BorderRadius borderRadius = BorderRadius.circular(10);
  Color color = Colors.blue;
  bool isPaused = true;
  late Timer periodicTimer;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 50;
    height = random.nextInt(300) + 50;
    borderRadius = BorderRadius.circular(random.nextInt(50) + 10);
    color = Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    setState(() {});
  }

  void setPeriodicTimer() =>
      periodicTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        changeShape();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isPaused = !isPaused;
          setState(() {
            if (isPaused) {
              periodicTimer.cancel();
            } else {
              setPeriodicTimer();
            }
          });
        },
        child: Icon(isPaused ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
