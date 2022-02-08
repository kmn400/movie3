import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie3/data/movie_api.dart';
import 'package:movie3/model/movie.dart';

class SearchViewModel with ChangeNotifier {
  List<Results> searchMovies = [];
  List<Results> originMovies = []; // Movie? _movies;

  final MovieApi _api;

  SearchViewModel(this._api);

  Future<void> showResult() async {
    List<Results> movies = await _api.fetchMovies();
    originMovies = movies;
    searchMovies = originMovies;
    notifyListeners();
  }

  Future<void> searchWithQuery(String query) async {
    final fetchedMovies = await _api.fetchMovies();
    searchMovies = fetchedMovies
        .where((movies) =>
            movies.title.contains(query) ||
            movies.originalTitle.contains(query))
        .toList();

    notifyListeners();
  }
}
