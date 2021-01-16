import 'package:feelibrary_client/screens/search_results/search_results.dart';
import 'package:feelibrary_client/services/movie.dart';
import 'package:flutter/material.dart';
import 'package:feelibrary_client/models/movie.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller;

  List<String> _feelingTypes = ['test', 'test2'];

  List<Tab> _tabs = <Tab>[Tab(text: "History"), Tab(text: "Advanced")];

  _onSubmitted(String search) {
    if (search.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResults(
            search: search,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: TextField(
              autofocus: true,
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search a movie',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (String value) {
                _onSubmitted(value);
              },
            ),
            bottom: TabBar(
              tabs: _tabs,
            ),
          ),
          body: TabBarView(
            children: [
              Text("history tab"),
              MultiSelectChipDisplay(
                  items:
                      _feelingTypes.map((e) => MultiSelectItem(e, e)).toList())
            ],
          )),
    );
  }
}
