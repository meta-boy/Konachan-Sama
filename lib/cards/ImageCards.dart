import 'dart:convert';

import 'package:konachan_uwu/podDump.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

import 'customCardView.dart';

class StaggeredCards extends StatefulWidget {
  String url;
  StaggeredCards({this.url});
  @override
  _StaggeredCardsState createState() => _StaggeredCardsState();
}

class _StaggeredCardsState extends State<StaggeredCards> {
  ScrollController _controller;
  Future<Posts> posts;
  int page = 1;

// 103.101.233.162:84
  Future<Posts> fetchPost() async {
    final response = await http.get(widget.url);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return Posts.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print("yes");
      setState(() {
        page += 100;
        posts = fetchPost();
        print(page);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    posts = fetchPost();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: posts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return StaggeredGridView.countBuilder(
            shrinkWrap: true,
            controller: _controller,
            crossAxisCount: 4,
            itemCount: snapshot.data.data.length,
            itemBuilder: (BuildContext context, int index) => new Container(
                child: customCardView(context, snapshot.data.data[index])),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          );
        }
        return Container(
            // height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: CircularProgressIndicator());
      },
    );
  }
}

//
