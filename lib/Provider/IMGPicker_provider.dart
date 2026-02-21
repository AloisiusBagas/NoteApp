import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class IMGPicker with ChangeNotifier {
  final picker = ImagePicker();
  File? _image;
  String? _imgpath;
  double limitsize = 2097152; // 2MB = 2097152 Bytes

  File? get image => _image;
  String? get imgpath => _imgpath;

  set setimgpath(String? text) => _imgpath = text;

  void resetimage() {
    _image = null;
    _imgpath = null;
    notifyListeners();
  }

  Future<Uint8List?> compressFile(File file) async {
    final Uint8List? compressed = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: 30,
    );
    return compressed;
  }

  Future<bool> pickimage(ImageSource source) async {
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) return false;

    final _file = File(pickedFile.path);
    Uint8List? imageBytes;

    if (_file.lengthSync() > limitsize) {
      imageBytes = await compressFile(_file);
    } else {
      imageBytes = _file.readAsBytesSync();
    }

    if (imageBytes == null) {
      await Fluttertoast.showToast(msg: "Could not process image");
      return false;
    }

    if (imageBytes.length < limitsize) {
      _image = _file;
      _imgpath = base64Encode(imageBytes);
      notifyListeners();
      return true;
    } else {
      await Fluttertoast.showToast(msg: "file size too large");
      return false;
    }
  }
}
