import 'dart:convert';

import 'package:feelibrary_client/environment_config.dart';
import 'package:http/http.dart' as http;

import 'package:feelibrary_client/models/movie.dart';

Future<List<Movie>> searchByTitle(String title) async {
  var queryParameters = {'title': title};
  var queryString = Uri(queryParameters: queryParameters).query;
  var endpoint = 'search/movies';
  final response =
      await http.get(EnvironmentConfig.API_URL + endpoint + '?' + queryString);

  List<dynamic> decoded = jsonDecode(response.body);
  List<Movie> movies = decoded.map((json) => Movie.fromJson(json)).toList();
  return movies;
}
