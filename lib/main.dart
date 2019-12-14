import 'package:konachan_uwu/cards/ImageCards.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.purpleAccent,
          primaryColorDark: Colors.white,
          primaryColor: Colors.white),
      darkTheme: ThemeData(accentColor: Colors.white),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Konachan-sama"),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      // body: customCardView(context, "https://konachan_uwu.donmai.us/data/sample/__zacian_pokemon_drawn_by_x_hako__sample-7baaf2759c0c536ff6e8776259c582c3.jpg")
      body: StaggeredCards(url:"https://konachan.com/post.json?limit=100&page=1"),
    );
  }
}
