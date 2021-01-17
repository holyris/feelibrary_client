import 'package:feelibrary_client/widgets/description_text.dart';
import 'package:flutter/material.dart';
import 'package:feelibrary_client/models/movie.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key key, this.movie}) : super(key: key);

  final Movie movie;

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  _onBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.movie.image,
                    height: 125,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.movie.title,
                          style: new TextStyle(
                            fontSize: 30.0,
                            // color: Colors.yellow,
                          ),
                        ),
                        Text(
                          widget.movie.releaseDate,
                          style: new TextStyle(
                            fontSize: 15.0,
                            // color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  DescriptionTextWidget(text: widget.movie.description),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Flexible(
                    child: MultiSelectChipDisplay(
                      // title: Text(
                      //   "Feelings",
                      //   style: TextStyle(fontSize: 13),
                      // ),
                      items: widget.movie.feelingsProportions
                          .map((e) =>
                              MultiSelectItem(e, e.feelingTypeId.toString()))
                          .toList(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
