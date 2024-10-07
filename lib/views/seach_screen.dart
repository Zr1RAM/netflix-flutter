import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_flutter/models/show_data.dart';
import 'package:netflix_flutter/services/api_service.dart';
import 'package:netflix_flutter/utils/navigation_utils.dart';
import 'package:netflix_flutter/views/details_screen.dart';
import 'package:netflix_flutter/widgets/SearchScreenWidgets/search_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final String tempImgUrl =
      'https://upload.wikimedia.org/wikipedia/en/thumb/e/e7/Video-x-generic.svg/1024px-Video-x-generic.svg.png';

  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  Timer? _debounce;
  String _searchQuery = "";
  List<ShowModel> _results = [];

  void _onSearchChanged(String query) {
    print('Search bar value: $query');
    // Cancel the previous timer
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    // Start a new timer
    _debounce = Timer(const Duration(milliseconds: 300), () {
      // Update teh search query and perform the search
      setState(() {
        _searchQuery = query;
      });

      _performSearch(query);
    });
  }

  void _performSearch(String query) async {
    // Simulate a search operation (e.g., API call)
    print('Searching for: $query');
    late List<ShowModel> response;
    setState(() {
      _isLoading = true;
    });
    try {
      response = await searchShows(query);
      print(response);
      setState(() {
        _results = response;
      });
    } catch (error) {
      throw error;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    // Here you would typically make an API call to fetch search results
  }

  @override
  void dispose() {
    _debounce?.cancel(); // Cancel the timer when the widget is disposed
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                    onPressed: () {
                      _controller.clear();
                      setState(() {
                        _results = [];
                      });
                    },
                    icon: const Icon(Icons.clear)),
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 750,
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors
                            .white, // Optional: Change color to match your theme
                      ),
                    )
                  : ListView.builder(
                      itemCount: _results.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            navigateToScreen(
                                context,
                                DetailsScreen(
                                  showDetails: _results[index],
                                ));
                          },
                          child: SearchItem(
                              imageURL: _results[index].show.image?.medium ??
                                  tempImgUrl,
                              title: _results[index].show.name),
                        );
                      },
                    ),
              // ListView(
              //   scrollDirection: Axis.vertical,
              //   children: [
              //     SearchItem(imageURL: tempImgUrl, title: "Insert title name"),
              //     SearchItem(imageURL: tempImgUrl, title: "Insert title name"),
              //     SearchItem(imageURL: tempImgUrl, title: "Insert title name"),
              //     SearchItem(imageURL: tempImgUrl, title: "Insert title name"),
              //     SearchItem(imageURL: tempImgUrl, title: "Insert title name"),
              //     SearchItem(imageURL: tempImgUrl, title: "Insert title name"),
              //     SearchItem(imageURL: tempImgUrl, title: "Insert title name"),
              //   ],
              // ),
            )
          ],
        ),
      ),
    );
  }
}
