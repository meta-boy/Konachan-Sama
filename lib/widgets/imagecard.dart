import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:konachan_uwu/model/data.dart';
import 'package:konachan_uwu/screens/image/image.dart';

class ImageCard extends StatefulWidget {
  ImageCard({this.data});
  final Data data;
  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    // print(widget.data.sampleUrl);
    return GestureDetector(
      child: Container(
        child: CachedNetworkImage(
          imageUrl: widget.data.previewUrl,
          fit: BoxFit.fitHeight,
          placeholder: (context, some) => Text(some),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageScreen(
                      data: widget.data,
                    )));
      },
    );
  }
}
