import 'package:flutter/material.dart';
import 'package:konachan_uwu/api/functions.dart';
import 'package:konachan_uwu/api/tagfunctions.dart';
import 'package:konachan_uwu/model/tag.dart';

class Tag extends StatefulWidget {
  Tag({this.tag});
  final TagData tag;
  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  double border;
  Color borderColor, containerColor, textColor;
  UniqueColorGenerator gen;

  bool isSelected;
  @override
  void initState() {
    border = 1.0;
    borderColor = Colors.black;
    isSelected = false;
    gen = UniqueColorGenerator();
    containerColor = gen.getColor();
    textColor = gen.getContrast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              border: Border.all(width: border, color: borderColor),
              color: containerColor),
          child: Center(
              child: Text(
            widget.tag.name,
            style: TextStyle(color: textColor, fontSize: 32),
          ))),
      onTap: () async{
        if (!isSelected) {
          await tagAdd(widget.tag.name);
          border = 10;
          borderColor = Colors.black;
          isSelected = true;
          
        } else {
          await tagRemove(widget.tag.name);
          border = 1.0;
          borderColor = Colors.black;
          isSelected = false;
        }

        setState(() {});
      },
    );
  }
}
