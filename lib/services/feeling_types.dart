import 'dart:convert';

import 'package:feelibrary_client/environment_config.dart';
import 'package:feelibrary_client/models/feeling_type.dart';
import 'package:http/http.dart' as http;

Future<List<FeelingType>> fetchAll() async {
  const String endpoint = 'feeling_types';
  final response = await http.get(EnvironmentConfig.API_URL + endpoint);

  final List<dynamic> decoded = jsonDecode(response.body);

  List<FeelingType> feelingTypes =
      decoded.map((json) => FeelingType.fromJson(json)).toList();
  return feelingTypes;
}
