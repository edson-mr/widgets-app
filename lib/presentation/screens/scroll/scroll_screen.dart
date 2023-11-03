import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({Key? key}) : super(key: key);

  @override
  State<ScrollScreen> createState() => _ScrollScreenState();
}

class _ScrollScreenState extends State<ScrollScreen> {
  ScrollController scrollController = ScrollController();
  List<int> imagesId = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // print(scrollController.position.pixels);
      // print(scrollController.position.maxScrollExtent);
      if (scrollController.position.pixels + 300 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    isMounted = false;
    scrollController.dispose();
    super.dispose();
  }

  void addFiveImage() {
    final lastId = imagesId.last;
    imagesId.addAll([1, 2, 3, 4, 5].map((e) => e + lastId));
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    // print('este print ocurre despues de los 3 segundos de carga');
    addFiveImage();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    if (scrollController.position.pixels + 150 <
        scrollController.position.maxScrollExtent) return;

    await scrollController.animateTo(scrollController.position.pixels + 150,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    final lastImage = imagesId.last;
    imagesId.clear();
    imagesId.add(lastImage + 1);
    addFiveImage();

    isLoading = false;
    if (!isMounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: imagesId.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesId[index]}/200/300'),
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!isLoading) context.pop();
        },
        child: isLoading
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh),
              )
            : const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
