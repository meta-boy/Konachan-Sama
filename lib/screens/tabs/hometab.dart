import 'package:flutter/material.dart';
import 'package:konachan_uwu/api/functions.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  ScrollController _scrollController = new ScrollController();
  int page;
  List<Widget> posts = [];
  @override
  void initState() {
    page = 1;

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        print(_scrollController.position.pixels);
        if (_scrollController.position.pixels != 0) {
          page += 1;
          // print("scrolled");
          getPosts(posts, page).then((value) {
            posts = value;
            setState(() {});
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPosts(posts, page),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (page < 2) posts = snapshot.data;
          return RefreshIndicator(
            child: ListView(
              controller: _scrollController,
              children: posts,
            ),
            onRefresh: () async {
              setState(() {
                posts = [];
                page = 1;
                getPosts(posts, page).then((value) {
                  posts = value;
                });
              });
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
