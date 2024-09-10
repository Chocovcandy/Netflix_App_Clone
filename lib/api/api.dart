import 'dart:convert';
// ignore: unused_import
import 'package:netflix_app_clone/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_app_clone/api/constants.dart';
import '../model/movie_model.dart';

class Api {

  //* upComingApiUrl variable.
  final upComingApiUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";

  //* popularApiUrl variable with refering upComingApiUrl.
  final popularApiUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

  //* topRatedApiUrl variable with refering upComingApiUrl.
  final topRatedApiUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";

  //* Create getUpcomingMovies()
  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upComingApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  //* Create getPopularMovies() with refering getUpcomingMovies()
  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  //* Create getTopRatedMovies() with refering getUpcomingMovies()
  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedApiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

}
