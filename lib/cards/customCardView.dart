import 'package:konachan_uwu/cards/fullCardView.dart';
import 'package:konachan_uwu/podDump.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget customCardView(BuildContext context, Post data) {
  // String url == null? "https://i.pinimg.com/originals/8f/c3/21/8fc32146cbf72ae17430e05ecc8b61be.gif"
  return GestureDetector(
    onTap: (){
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FullCardView(url: data.fileUrl, tags: data.tags)),
  );
    },
      child: Container(
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(4),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: CachedNetworkImage(
          imageUrl: data.previewFileUrl ?? "https://danbooru.donmai.us/data/sample/__zacian_pokemon_drawn_by_x_hako__sample-7baaf2759c0c536ff6e8776259c582c3.jpg",
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        // child: Image.network(imageurl)
      ),
    ),
  );
}
