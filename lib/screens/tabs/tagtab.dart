import 'package:flutter/material.dart';
import 'package:konachan_uwu/api/functions.dart';

class TagTab extends StatefulWidget {
  @override
  _TagTabState createState() => _TagTabState();
}

class _TagTabState extends State<TagTab> {
  ScrollController _scrollController = new ScrollController();
  int tagPage;
  List<Widget> tags = [];
  @override
  void initState() {
    tagPage = 50;
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        print(_scrollController.position.pixels);
        if (_scrollController.position.pixels != 0) {
          tagPage += 10;
          print("scrolled");
          getTags(tags, tagPage).then((value) {
            tags = value;
            setState(() {});
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTags(tags, tagPage),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (tagPage < 51) tags = snapshot.data;
          // print(tagPage);
          return ListView(
            controller: _scrollController,
            children: tags,
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
