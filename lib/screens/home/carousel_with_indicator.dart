import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  final List<XFile>? imageSliders;

  const CarouselWithIndicatorDemo({
    Key? key,
    required List<XFile> this.imageSliders,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.imageSliders?.map((i) {
            return Image(
              height: 300,
              width: 300,
              fit: BoxFit.cover,
              image: FileImage(
                File(i.path),
              ),
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              height: 300,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageSliders?.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).primaryColor).withOpacity(
                        _current == entry.key ? 0.9 : 0.4,
                      ),
                    ),
                  ),
                );
              }).toList() ??
              <Widget>[],
        ),
      ],
    );
  }
}
