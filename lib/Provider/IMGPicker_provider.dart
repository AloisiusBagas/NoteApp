import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class IMGPicker with ChangeNotifier {
  final picker = ImagePicker();
  File _image;
  String _imgpath;
  String _imgtemp;
  double limitsize = 2097152; // 2MB = 2097152 Bytes

  File get image => _image;
  String get imgpath => _imgpath;
  String get imagetemp => _imgtemp;

  set setimgpath(String text) => _imgpath = text;

  void resetimage() {
    _image = null;
    _imgpath = null;
    notifyListeners();
  }

  Future<File> compressFile(File file) async {
    final File compressedFile =
        await FlutterNativeImage.compressImage(file.path, quality: 30);
    return compressedFile;
  }

  Future<bool> pickimage(ImageSource source) async {
    final image = await picker.getImage(source: source);
    final _file = File(image.path);
    if (_file.lengthSync() > limitsize) {
      _image = await compressFile(_file);
    } else {
      _image = _file;
    }
    // print("Size gambar (Before) : ${_file.lengthSync()}");
    // print("Size gambar (After) : ${_image.lengthSync()}");

    if (image != null && _image.lengthSync() < limitsize) {
      _imgpath = base64Encode(_image.readAsBytesSync());
      notifyListeners();
      return true;
    } else {
      await Fluttertoast.showToast(msg: "file size too large");
      return false;
    }
  }
}
