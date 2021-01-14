import 'package:http/http.dart' as http;

import 'package:feelibrary_client/models/movie.dart';

Future<List<Movie>> searchByTitle() async {
  final response = await http.get("");
}
