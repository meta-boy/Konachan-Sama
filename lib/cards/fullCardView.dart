import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

import 'ImageCards.dart';

void main() => runApp(FullCardView());

class FullCardView extends StatefulWidget {
  String url;
  List<String> tags;
  FullCardView({this.url, this.tags});
  @override
  _FullCardViewState createState() => _FullCardViewState();
}

class _FullCardViewState extends State<FullCardView> {
  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File _imageFile;
  int _progress = 0;
  List<FloatingActionButton> tagList;

  List<File> _mulitpleFiles = [];

  @override
  void initState() {
    super.initState();

    ImageDownloader.callback(onProgressUpdate: (String imageId, int progress) {
      setState(() {
        _progress = progress;
      });
    });
    print(widget.tags.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      endDrawer: Drawer(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Tags",
                  style: TextStyle(fontSize: 35),
                )),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.tags.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton.extended(
                  heroTag: widget.tags[index],
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 0.0,
                  label: Text(widget.tags[index]),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scaffold(
                                  backgroundColor: Colors.black87,
                                  appBar: AppBar(
                                    title: Text("Konachan-sama"),
                                    centerTitle: true,
                                    backgroundColor: Colors.black12,
                                  ),
                                  body: StaggeredCards(
                                      url:
                                          "https://konachan.com/post.json?limit=100&tags=${widget.tags[index]}"),
                                )));
                  },
                ),
              );
            },
          ),
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.black12,

      ),
      body: ListView(
        children: <Widget>[
          
          CachedNetworkImage(
          imageUrl: widget.url ?? "https://danbooru.donmai.us/data/sample/__zacian_pokemon_drawn_by_x_hako__sample-7baaf2759c0c536ff6e8776259c582c3.jpg",
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            height: 300,
            child: Center(child: CircularProgressIndicator())),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
              child:  Text('Progress: $_progress %', style: TextStyle(color: Colors.white),),
            ),
        ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: FloatingActionButton.extended(
                label: Text("download"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                icon: Icon(Icons.file_download),
                elevation: 3,
                onPressed: () {
                  _downloadImage(
                    widget.url,
                    destination: AndroidDestinationType.custom(directory: 'sample')
                    ..inExternalFilesDir()
                      ..subDirectory("youWeeb.png"),
                  );
                },
              ),
            ),
          ),
          StaggeredCards(
              url:
                  "https://konachan.com/post.json?limit=100&tags=${widget.tags[Random().nextInt(widget.tags.length)]}")
        ],
      ),
    );
  }

  Future<void> _downloadImage(String url,
      {AndroidDestinationType destination, bool whenError = false}) async {
    String fileName;
    String path;
    int size;
    String mimeType;
    try {
      String imageId;

      if (whenError) {
        imageId = await ImageDownloader.downloadImage(url).catchError((error) {
          if (error is PlatformException) {
            var path = "";
            if (error.code == "404") {
              print("Not Found Error.");
            } else if (error.code == "unsupported_file") {
              print("UnSupported FIle Error.");
              path = error.details["unsupported_file_path"];
            }
            setState(() {
              _message = error.toString();
              _path = path;
            });
          }

          print(error);
        }).timeout(Duration(seconds: 10), onTimeout: () {
          print("timeout");
        });
      } else {
        if (destination == null) {
          imageId = await ImageDownloader.downloadImage(url);
          print("downloaded");
        } else {
          imageId = await ImageDownloader.downloadImage(
            url,
            destination: destination,
          );
          print("downloaded");

        }
      }

      if (imageId == null) {
        return;
      }
      fileName = await ImageDownloader.findName(imageId);
      path = await ImageDownloader.findPath(imageId);
      size = await ImageDownloader.findByteSize(imageId);
      mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      setState(() {
        _message = error.message;
      });
      return;
    }

    if (!mounted) return;

    setState(() {
      var location = Platform.isAndroid ? "Directory" : "Photo Library";
      _message = 'Saved as "$fileName" in $location.\n';
      _size = 'size:     $size';
      _mimeType = 'mimeType: $mimeType';
      _path = path;

      if (!_mimeType.contains("video")) {
        _imageFile = File(path);
      }
    });
  }
}
