import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarouselWithOutIndicatorDemo extends StatefulWidget {
  final List<String> imageSliders;

  const CarouselWithOutIndicatorDemo({
    Key? key,
    required this.imageSliders,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithOutIndicatorDemo> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.imageSliders.map((i) {
            return Image(
              height: 200,
              width: 300,
              fit: BoxFit.cover,
              image: NetworkImage(i),
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 200,
            enableInfiniteScroll: false,
          ),
        ),
      ],
    );
  }
}
