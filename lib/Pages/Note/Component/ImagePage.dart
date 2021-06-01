import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mynote_app/Constant/ConstColor.dart';

class Imagepage extends StatelessWidget {
  final Function deleteimage;
  final String imgpath;

  const Imagepage({Key key, this.imgpath, this.deleteimage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyBGColor,
        appBar: AppBar(
          backgroundColor: greyBGColor,
          actions: [
            IconButton(
                padding: const EdgeInsets.only(right: 8),
                tooltip: "Delete",
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteimage();
                  Navigator.pop(context);
                })
          ],
        ),
        body: Center(
          child: InteractiveViewer(
            child: Image.memory(
              base64Decode(imgpath),
            ),
          ),
        ));
  }
}
