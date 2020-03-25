import 'package:flutter/material.dart';
import 'package:konachan_uwu/api/functions.dart';

class CustomChip extends StatefulWidget {
  CustomChip({this.text});

  final String text;
  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  Color containerColor, textColor;
  UniqueColorGenerator gen;

  @override
  void initState() {
    gen = UniqueColorGenerator();
    containerColor = gen.getColor();
    textColor = gen.getContrast();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
        backgroundColor: containerColor,
        label: Text(
          widget.text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
