// Define a data model for featured content
import 'package:netflix_flutter/models/show_data.dart';

class FeaturedContentData {
  final String image;
  final String title;
  final ShowModel? show;

  FeaturedContentData({required this.image, required this.title, this.show});
}
