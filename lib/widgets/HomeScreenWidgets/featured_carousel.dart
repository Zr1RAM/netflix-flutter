import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_flutter/models/featured_content_data.dart';
import 'package:netflix_flutter/utils/navigation_utils.dart';
import 'package:netflix_flutter/views/details_screen.dart';
import 'package:netflix_flutter/widgets/HomeScreenWidgets/featured_content.dart';

class FeaturedCarousel extends StatefulWidget {
  final List<FeaturedContentData> featuredContents;
  const FeaturedCarousel({super.key, required this.featuredContents});

  @override
  State<FeaturedCarousel> createState() => _FeaturedCarouselState();
}

class _FeaturedCarouselState extends State<FeaturedCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Navigate to the home screen after a delay
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.featuredContents.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      // _pageController.jumpToPage(_currentPage);
      _pageController.animateToPage(_currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (int page) {
          _currentPage = page;
        },
        children: widget.featuredContents.map((content) {
          return InkWell(
            onTap: () {
              navigateToScreen(
                  context,
                  DetailsScreen(
                    showDetails: content.show,
                  ));
            },
            child: FeaturedContent(
              image: content.image,
              title: content.title,
            ),
          );
        }).toList(),
      ),
    );
  }
}
