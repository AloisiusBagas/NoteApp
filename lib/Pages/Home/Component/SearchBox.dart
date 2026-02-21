import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mynote_app/Provider/Note_provider.dart';
import 'package:mynote_app/Provider/Theme_Provider.dart';
import 'package:provider/provider.dart';

class Debouncer {
  Debouncer({this.miliseconds});
  final int? miliseconds;
  Timer? _timer;

  Future run(VoidCallback action) async {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: miliseconds ?? 500), action);
  }
}

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  FocusNode searchnode = FocusNode();
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _themechanger = Provider.of<ThemeProvider>(context);
    final _noteprovider = Provider.of<NoteProvider>(context);

    final _debouncer = Debouncer(miliseconds: 1300);
    return TextField(
        controller: searchcontroller,
        focusNode: searchnode,
        decoration: InputDecoration(
          hintText: "Search...",
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFFCBCBCB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                color: _themechanger.isdarkmode == true
                    ? const Color(0xFFE4E4E4)
                    : const Color(0xFFB3B3B3)),
          ),
        ),
        onChanged: (value) {
          _debouncer.run(() {
            _noteprovider.filter = value;
          });
        });
  }
}
