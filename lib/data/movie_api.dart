import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie3/model/movie.dart';

class MovieApi {
  Future<List<Results>> fetchMovies() async {
    final response = await http.get(Uri.parse(
            'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1')
        // 'https://api.themoviedb.org/3/search/movie?api_key=a64533e7ece6c72731da47c9c8bc691f&query=$query&language=en-EN')
        );

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body)['results'];
      return jsonList.map((e) => Results.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
