import 'package:feelibrary_client/models/feeling_type.dart';
import 'package:feelibrary_client/models/movie.dart';
import 'package:feelibrary_client/services/movie.dart';
import 'package:feelibrary_client/widgets/movie_list_tile.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  SearchResults({Key key, this.search, this.feelingTypes}) : super(key: key);

  final String search;
  final List<FeelingType> feelingTypes;

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  Future<List<Movie>> movieSearchResults;

  @override
  void initState() {
    super.initState();
    if (widget.search != null) {
      movieSearchResults = searchByTitle(widget.search);
    } else if (widget.feelingTypes.length > 0) {
      movieSearchResults = searchByFeelingTypes(widget.feelingTypes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.search != null
            ? Text(widget.search)
            : Text("Search results"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder<List<Movie>>(
            future: movieSearchResults,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.length != 0) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Movie movie = snapshot.data[index];
                        return MovieListTile(
                          movie: movie,
                        );
                      });
                } else {
                  return Text("No results.");
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
