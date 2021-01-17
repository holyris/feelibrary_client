import 'package:feelibrary_client/models/feelings_proportion.dart';

class Movie {
  final int id;
  final String title;
  final String description;
  final String releaseDate;
  final String image;
  final List<FeelingsProportion> feelingsProportions;

  Movie(this.id, this.title, this.description, this.releaseDate, this.image,
      this.feelingsProportions);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        releaseDate = json['releaseDate'],
        image = json['image'],
        feelingsProportions = toFeelingsProportions(json['feelingsProportion']);

  static List<FeelingsProportion> toFeelingsProportions(List<dynamic> json) {
    return json.map((e) => FeelingsProportion.fromJson(e)).toList();
  }
}
