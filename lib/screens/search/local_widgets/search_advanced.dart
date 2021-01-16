import 'package:feelibrary_client/models/feeling_type.dart';
import 'package:feelibrary_client/screens/search_results/search_results.dart';
import 'package:feelibrary_client/services/feeling_types.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class SearchAdvanced extends StatefulWidget {
  @override
  _SearchAdvancedState createState() => _SearchAdvancedState();
}

class _SearchAdvancedState extends State<SearchAdvanced> {
  Future<List<FeelingType>> _feelingTypes;
  List<FeelingType> _selectedFeelingTypes = [];

  @override
  void initState() {
    super.initState();
    _feelingTypes = fetchAll();
  }

  _onFloatingButtonPressed() {
    if (_selectedFeelingTypes.length > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResults(
            feelingTypes: _selectedFeelingTypes,
          ),
        ),
      );
    }
  }

  _reset() {
    _selectedFeelingTypes = [];
  }

  _feelingsWidget(List<FeelingType> feelingTypes) {
    return MultiSelectBottomSheetField(
      initialChildSize: 0.4,
      title: Text("Select feelings"),
      buttonText: Text("Select feelings"),
      buttonIcon: Icon(Icons.emoji_emotions),
      decoration: BoxDecoration(
        // color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(40)),
        border: Border.all(
          width: 2,
        ),
      ),
      items: feelingTypes.map((e) => MultiSelectItem(e, e.name)).toList(),
      searchable: true,
      listType: MultiSelectListType.CHIP,
      onConfirm: (values) {
        _selectedFeelingTypes = values;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Center(
                child: FutureBuilder<List<FeelingType>>(
                  future: _feelingTypes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length != 0) {
                        return _feelingsWidget(snapshot.data);
                      } else {
                        return Text("No feelings.");
                      }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: FloatingActionButton(
                heroTag: "delete",
                mini: true,
                onPressed: _reset,
                child: Icon(Icons.delete),
              ),
            ),
            FloatingActionButton.extended(
              heroTag: "search",
              onPressed: _onFloatingButtonPressed,
              label: Text("Search"),
              icon: Icon(Icons.search),
            )
          ],
        ));
  }
}
