import 'package:flutter/material.dart';
import 'package:netflix_flutter/models/show_data.dart';
import 'package:netflix_flutter/services/api_service.dart';

class ShowProvider with ChangeNotifier {
  List<ShowModel> _shows = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ShowModel> get shows => _shows;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAndSetShows() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _shows = await fetchShows();
      print("Response: ");
      print(_shows);
    } catch (error) {
      _errorMessage = error.toString();
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
