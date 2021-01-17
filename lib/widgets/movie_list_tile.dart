import 'package:feelibrary_client/models/movie.dart';
import 'package:feelibrary_client/screens/movie/movie_screen.dart';
import 'package:flutter/material.dart';

class MovieListTile extends StatefulWidget {
  const MovieListTile({Key key, this.movie}) : super(key: key);

  final Movie movie;

  @override
  _MovieListTileState createState() => _MovieListTileState();
}

class _MovieListTileState extends State<MovieListTile> {
  _onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieScreen(movie: widget.movie),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _onTap,
      leading: widget.movie.image != null
          ? Image.network(widget.movie.image)
          // : Center(
          //     child: Icon(Icons.image_not_supported_outlined),
          //   ),
          : Icon(Icons.image_not_supported_outlined),
      title: Text(widget.movie.title),
      subtitle: widget.movie.releaseDate != null
          ? Text(widget.movie.releaseDate)
          : null,
    );
  }
}
