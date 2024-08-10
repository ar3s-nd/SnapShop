import 'package:flutter/material.dart';

class ScrollableImages extends StatefulWidget {
  final List<String>? imagePaths;

  const ScrollableImages({super.key, required this.imagePaths});

  @override
  _ScrollableImagesState createState() => _ScrollableImagesState();
}

class _ScrollableImagesState extends State<ScrollableImages> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // images
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imagePaths?.length,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  width: 220,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.deepPurple[100],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      widget.imagePaths != null
                      ? widget.imagePaths![index]
                      : 'lib/images/img_not_found.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // the pagination dots.
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.imagePaths!.length, (index) {
            return Container(
              margin: const EdgeInsets.all(4.0),
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.blueAccent : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
