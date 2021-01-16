import 'package:feelibrary_client/screens/search/local_widgets/search_advanced.dart';
import 'package:feelibrary_client/screens/search_results/search_results.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller;
  FocusNode _focusNode;
  List<Tab> _tabs = <Tab>[Tab(text: "History"), Tab(text: "Advanced")];

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNode.dispose();

    super.dispose();
  }

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
            focusNode: _focusNode,
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
          children: [Text("history tab"), SearchAdvanced()],
        ),
        // floatingActionButton: FloatingActionButton(
        //     // onPressed: _onSubmitted("test"),
        //     // tooltip: 'Search',
        //     // child: Icon(Icons.search),
        //     ),
      ),
    );
  }
}
