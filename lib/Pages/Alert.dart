import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';
import 'package:mynote_app/Provider/Note_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';

void deletealert(
    BuildContext context, NoteProvider noteProvider, bool ishomepage, int id) {
  final AlertDialog alertDialog = AlertDialog(
    elevation: 0,
    title: const Text("Delete Note?"),
    content: const Text("Are you sure you want to delete this note?",
        style: TextStyle(fontSize: 15)),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("CANCEL")),
      TextButton(
          onPressed: () {
            noteProvider.deleteNote(id);
            Navigator.pop(context);
            if (ishomepage == false) Navigator.pop(context);
            Fluttertoast.showToast(
                msg: "Note deleted successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 12.0);
          },
          child: const Text(
            "DELETE",
            style: TextStyle(color: Colors.redAccent),
          ))
    ],
  );
  showModal(
    configuration: const FadeScaleTransitionConfiguration(
        transitionDuration: Duration(milliseconds: 450)),
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}

void infoalert(BuildContext context, ThemeProvider themeProvider,
    String createdat, String updatedat) {
  final AlertDialog alert = AlertDialog(
    elevation: 0,
    title: Row(
      children: <Widget>[
        Icon(
          Icons.info,
          color: themeProvider.isdarkmode == true
              ? Colors.white
              : Colors.grey[800],
        ),
        const SizedBox(width: 10),
        const Text("Info"),
      ],
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Created at : $createdat", style: const TextStyle(fontSize: 15.5)),
        const SizedBox(height: 5),
        Text("Updated at : $updatedat", style: const TextStyle(fontSize: 15.5)),
      ],
    ),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Done",
          ))
    ],
  );
  showModal(
    configuration: const FadeScaleTransitionConfiguration(
        transitionDuration: Duration(milliseconds: 450)),
    context: context,
    builder: (context) {
      return alert;
    },
  );
}

void pickImagealert(
    BuildContext context, ThemeProvider themeProvider, IMGPicker imgPicker) {
  final AlertDialog alert = AlertDialog(
    elevation: 0,
    title: Row(
      children: <Widget>[
        Icon(
          Icons.info,
          color: themeProvider.isdarkmode == true
              ? Colors.white
              : Colors.grey[800],
        ),
        const SizedBox(width: 10),
        const Text("Choose Image"),
      ],
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: () {
            imgPicker.pickimage(ImageSource.gallery);
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Row(
              children: const [
                Icon(Icons.photo_album),
                SizedBox(width: 10),
                Text("Gallery"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {
            imgPicker.pickimage(ImageSource.camera);
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Row(
              children: const [
                Icon(Icons.camera_alt),
                SizedBox(width: 10),
                Text("Camera"),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  showModal(
    configuration: const FadeScaleTransitionConfiguration(
        transitionDuration: Duration(milliseconds: 450)),
    context: context,
    builder: (context) {
      return alert;
    },
  );
}
