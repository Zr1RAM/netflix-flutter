import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_flutter/models/show_data.dart';

Future<List<ShowModel>> fetchShows() async {
  final response =
      await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
  // print(response.statusCode);
  if (response.statusCode == 200) {
    // print(response.body);
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((show) => ShowModel.fromJson(show)).toList();
  } else {
    throw Exception('Failed to load shows');
  }
}

Future<List<ShowModel>> searchShows(String query) async {
  if (query.isEmpty) return [];
  final response =
      await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((show) => ShowModel.fromJson(show)).toList();
  } else {
    throw Exception('Search term failed');
  }
}
