import 'package:flutter/material.dart';
import 'package:konachan_uwu/screens/tabs/hometab.dart';
import 'package:konachan_uwu/screens/tabs/tagtab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: SafeArea(
            child: Drawer(),
          ),
          appBar: AppBar(
            title: Text("Konachan - Sama"),
            bottom: TabBar(tabs: [
              Text(
                "Home",
                style: TextStyle(fontSize: 16),
              ),
              Text("Tags", style: TextStyle(fontSize: 16)),
            ]),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.texture), onPressed: () {}),
              IconButton(icon: Icon(Icons.view_carousel), onPressed: () {}),
              IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
            ],
          ),
          body: TabBarView(children: [HomeTab(), TagTab()]),
        ));
  }
}
