import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliderImage {
  final String url;
  final String title;
  final String subtitle;

  const SliderImage({
    required this.url,
    required this.title,
    required this.subtitle,
  });
}

const List<SliderImage> images = [
  SliderImage(
    url: 'assets/images/1.png',
    title: 'soy el titulo 1',
    subtitle: 'soy el subtitulo 1',
  ),
  SliderImage(
    url: 'assets/images/2.png',
    title: 'soy el titulo 2',
    subtitle: 'soy el subtitulo 2',
  ),
  SliderImage(
    url: 'assets/images/3.png',
    title: 'soy el titulo 3',
    subtitle: 'soy el subtitulo 3',
  ),
];

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  bool isEnd = false;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if (!isEnd && page >= images.length - 1.5) {
        isEnd = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              final image = images[index];
              return _CustomImage(image: image);
            },
          ),
          Positioned(
            top: 20,
            right: 20,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),
          if (isEnd)
            Positioned(
              bottom: 20,
              right: 20,
              child: FadeInRight(
                delay: const Duration(seconds: 1),
                from: 15,
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Aceptar'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CustomImage extends StatelessWidget {
  final SliderImage image;
  const _CustomImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image.url),
            const SizedBox(height: 10),
            Text(image.title),
            const SizedBox(height: 10),
            Text(image.subtitle),
          ],
        ),
      ),
    );
  }
}
