import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:konachan_uwu/model/data.dart';
import 'package:konachan_uwu/model/tag.dart';
import 'package:konachan_uwu/widgets/imagecard.dart';
import 'package:konachan_uwu/widgets/tagscard.dart';

Future<List<Widget>> getPosts(List<Widget> oldList, int page) async {
  if (oldList.isNotEmpty) {
    oldList.removeLast();
  }
  final http.Response response =
      await http.get("https://konachan.com/post.json?page=$page");
  List<Widget> newList = <Widget>[];
  if (response.statusCode == 200) {
    final List data = json.decode(response.body);
    print(page);
    data.forEach((element) {
      Data d = Data.fromJson(element);
      newList.add(ImageCard(
        data: d,
      ));
    });
  } else {
    throw Exception('Failed to load Posts');
  }
  newList.add(Container(
    height: 40,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  ));
  return oldList + newList;
}

Future<List<Widget>> getTags(List<Widget> oldList, int page) async {
  if (oldList.isNotEmpty) {
    oldList.removeLast();
  }
  final http.Response response =
      await http.get("https://konachan.com/tag.json?limit=$page");
  List<Widget> newList = <Widget>[];
  if (response.statusCode == 200) {
    final List data = json.decode(response.body);
    // print(page);
    if (oldList.isNotEmpty) {
      for (int i = oldList.length - 1; i < page; i++) {
        TagData d = TagData.fromJson(data[i]);
        newList.add(Tag(
          tag: d,
        ));
      }
    } else {
      // print("ok");
      data.forEach((element) {
        TagData d = TagData.fromJson(element);
        newList.add(Tag(
          tag: d,
        ));
      });
      newList.add(Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ));
      return oldList + newList;
    }
  } else {
    throw Exception('Failed to load Tags');
  }
  newList.add(Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  ));
  return oldList + newList;
}

class UniqueColorGenerator {
  static Random random = new Random();
  Color color;
  Color getColor() {
    color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
    return color;
  }

  Color getContrast() {
    if (color == null) color = Colors.transparent;
    final Color some =
        color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return some;
  }
}
