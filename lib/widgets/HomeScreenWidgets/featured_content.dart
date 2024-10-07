import 'package:flutter/material.dart';
import 'package:netflix_flutter/utils/navigation_utils.dart';
import 'package:netflix_flutter/views/details_screen.dart';

class FeaturedContent extends StatelessWidget {
  // const FeaturedContent({super.key});

  final String image;
  final String title;

  const FeaturedContent({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.network(image, fit: BoxFit.cover, width: double.infinity),
        Center(
            child: Container(
          color: Colors.black45,
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )),
      ],
    );
  }
}
