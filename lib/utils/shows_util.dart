import 'package:netflix_flutter/models/featured_content_data.dart';
import 'package:netflix_flutter/models/show_data.dart';
import 'package:netflix_flutter/utils/utils.dart';

Map<String, List<ShowModel>> classifyShowsByGenre(List<ShowModel> shows) {
  Map<String, List<ShowModel>> genreMap = {};

  for (var showModel in shows) {
    // Get the genres for the current show
    for (var genre in showModel.show.genres) {
      // If the genre is not already in the map, initialize it
      if (!genreMap.containsKey(genre)) {
        genreMap[genre] = [];
      }
      // Add the current showModel to the list for this genre
      genreMap[genre]!.add(showModel);
    }
  }

  return genreMap;
}

List<FeaturedContentData> getFeaturedContentData(List<ShowModel> shows, int n) {
  shows = getRandomElements(shows, n);
  List<FeaturedContentData> featureContentData = shows.map((showModel) {
    // print(showModel.show.name);
    return FeaturedContentData(
      image: showModel.show.image != null
          ? showModel.show.image!.medium
          : 'https://upload.wikimedia.org/wikipedia/commons/d/d8/Gnome-image-x-generic.svg', // Use the original image URL or an empty string
      title: showModel.show.name, // Use the show name as the title
      show: showModel, // Include the ShowModel instance
    );
  }).toList();
  // print(featureContentData);
  return featureContentData;
}
