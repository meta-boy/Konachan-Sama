import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:intl/intl.dart';
import 'package:konachan_uwu/api/functions.dart';
import 'package:konachan_uwu/api/imagefunctions.dart';
import 'package:konachan_uwu/model/data.dart';
import 'package:konachan_uwu/widgets/customchip.dart';
import 'package:share/share.dart';

class ImageScreen extends StatefulWidget {
  ImageScreen({this.data});
  final Data data;
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  UniqueColorGenerator uq = UniqueColorGenerator();
  var formatter = DateFormat('EEE, MMM d, yyyy');
  DateTime createdAt;
  bool downloaded = false;
  int _progress;

  @override
  void initState() {
    hasDownloaded(widget.data.id.toString(), true).then((value) {
      downloaded = value;
      setState(() {});
    });
    _progress = 0;

    createdAt =
        DateTime.fromMillisecondsSinceEpoch(widget.data.createdAt * 1000);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> tags = widget.data.tags.split(" ");
    Map<String, String> rating = {
      "s": " Safe",
      "e": " Explicit",
      "q": " Questionable"
    };
    print(widget.data.rating);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (downloaded) {
            print("has DOwnloaded");
            return;
          }
          try {
            print("in here");
            // Saved with this method.
            var imageId = await ImageDownloader.downloadImage(
                widget.data.fileUrl,
                destination: AndroidDestinationType.directoryPictures);
            if (imageId == null) {
              print("nop");
              return;
            }
            // Below is a method of obtaining saved image information.
            var fileName = await ImageDownloader.findName(imageId);
            var path = await ImageDownloader.findPath(imageId);
            var size = await ImageDownloader.findByteSize(imageId);
            var mimeType = await ImageDownloader.findMimeType(imageId);
            print(path);
          } on PlatformException catch (error) {
            print(error);
          }
          downloaded = true;

          await hasDownloaded(widget.data.id.toString(), false);
          setState(() {});
        },
        child: downloaded ? Icon(Icons.check) : Icon(Icons.file_download),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.data.id.toString()),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: null),
          IconButton(icon: Icon(Icons.share), onPressed: (){
            Share.share(widget.data.fileUrl, subject: "From Konachan - Sama");
            print("works");
          })
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            CachedNetworkImage(
              fit: BoxFit.fitHeight,
              imageUrl: widget.data.sampleUrl,
              placeholder: (context, url) => Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Center(child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.person),
                        Text(
                          " " + widget.data.author,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        Text(" " + formatter.format(createdAt),
                            style: TextStyle(color: Colors.white, fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.score),
                        Text(" " + widget.data.score.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.check_circle),
                        Text(rating[widget.data.rating],
                            style: TextStyle(color: Colors.white, fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: <Widget>[
                        Text("Tags:",
                            style: TextStyle(color: Colors.white, fontSize: 16))
                      ],
                    ),
                  ),
                  Container(
                    child: Wrap(
                        children: tags
                            .map((e) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: CustomChip(
                                  text: e,
                                )))
                            .toList()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
