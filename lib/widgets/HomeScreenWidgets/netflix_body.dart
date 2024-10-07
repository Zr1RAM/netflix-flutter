import 'package:flutter/material.dart';
import 'package:netflix_flutter/models/featured_content_data.dart';
import 'package:netflix_flutter/models/show_data.dart';
import 'package:netflix_flutter/providers/show_provider.dart';
import 'package:netflix_flutter/services/api_service.dart';
import 'package:netflix_flutter/utils/shows_util.dart';
import 'package:netflix_flutter/utils/utils.dart';
import 'package:netflix_flutter/widgets/HomeScreenWidgets/featured_carousel.dart';
import 'package:netflix_flutter/widgets/HomeScreenWidgets/netflix_categories.dart';
import 'package:provider/provider.dart';

class NetflixBody extends StatefulWidget {
  const NetflixBody({super.key});

  @override
  _NetflixBodyState createState() => _NetflixBodyState();
}

class _NetflixBodyState extends State<NetflixBody> {
  bool _isLoading = true;
  String? _errorMessage;
  late List<ShowModel> responseShows = [];
  // late Map<String, List<ShowModel>> shows;

  @override
  void initState() {
    super.initState();
    _fetchShows();
  }

  Future<void> _fetchShows() async {
    late List<ShowModel> response;
    try {
      response = await fetchShows();
      setState(() {
        responseShows = response;
      });
      // print('SUCCESS!!!');
      // print(responseShows);
      //getRandomElements(responseShows, 5);
      // shows = classifyShowsByGenre(responseShows);
    } catch (error) {
      _errorMessage = error.toString();
      throw error;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Text(
          'Error: $_errorMessage',
          style: const TextStyle(color: Colors.red, fontSize: 18),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {}, child: const Text('All')),
              TextButton(onPressed: () {}, child: const Text('TV Shows')),
              TextButton(onPressed: () {}, child: const Text('Movies')),
              TextButton(onPressed: () {}, child: const Text('My List')),
            ],
          ),
          FeaturedCarousel(
            featuredContents: getFeaturedContentData(responseShows, 5),
          ),
          NetflixCategories(
            showsData: responseShows,
          ),
        ],
      ),
    );
  }
}
