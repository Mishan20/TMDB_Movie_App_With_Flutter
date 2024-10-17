import 'dart:convert';

import 'package:http/http.dart';
import 'package:tmdb_movie_app/models/movies_model.dart';

class ApiService {
  final apiKey = "api_key=9edcdf5f2e36f8892a5a96e9e4976f7f";
  final baseUrl = "https://api.themoviedb.org/3/movie/popular?";

  Future<List<Movie>> getMovies({required int page}) async {
    //send request
    Response response = await get(Uri.parse('$baseUrl$apiKey&page=$page'));
    //check response status code
    if (response.statusCode == 200) {
      //extrct response body
      Map<String, dynamic> body = jsonDecode(response.body);
      //extract result from body
      List<dynamic> data = body['results'];
      //map to movie model
      List<Movie> movies = data.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception(response.statusCode.toString());
    }
  }
}
