import 'package:flutter/material.dart';

class MovieListTile extends StatelessWidget {
  MovieListTile(this.title, this.releaseDate, this.image);

  final String title;
  final String releaseDate;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: image != null
          ? Image.network(image)
          // : Center(
          //     child: Icon(Icons.image_not_supported_outlined),
          //   ),
          : Icon(Icons.image_not_supported_outlined),
      title: Text(title),
      subtitle: releaseDate != null ? Text(releaseDate) : null,
    );
  }
}
