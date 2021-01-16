import 'dart:convert';

import 'package:feelibrary_client/environment_config.dart';
import 'package:feelibrary_client/models/feeling_type.dart';
import 'package:http/http.dart' as http;

import 'package:feelibrary_client/models/movie.dart';

Future<List<Movie>> searchByTitle(String title) async {
  final queryParameters = {'title': title};
  final String queryString = Uri(queryParameters: queryParameters).query;
  const String endpoint = 'search/movies';
  final response =
      await http.get(EnvironmentConfig.API_URL + endpoint + '?' + queryString);

  final List<dynamic> decoded = jsonDecode(response.body);
  List<Movie> movies = decoded.map((json) => Movie.fromJson(json)).toList();
  return movies;
}

Future<List<Movie>> searchByFeelingTypes(List<FeelingType> feelingTypes) async {
  String queryString = "";
  for (var feelingType in feelingTypes) {
    queryString += 'feelings= + ${feelingType.id}&';
  }
  const String endpoint = 'search/movies';

  final response =
      await http.get(EnvironmentConfig.API_URL + endpoint + '?' + queryString);

  final List<dynamic> decoded = jsonDecode(response.body);
  List<Movie> movies = decoded.map((json) => Movie.fromJson(json)).toList();
  return movies;
}
