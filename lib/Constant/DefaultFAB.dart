import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynote_app/Pages/Note/NotePage.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';

class DefaultFAB extends StatelessWidget {
  const DefaultFAB({Key? key, required IMGPicker imgprovider, this.isArchived})
      : _imgprovider = imgprovider,
        super(key: key);

  final IMGPicker _imgprovider;
  final bool? isArchived;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Add Note",
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NotePage(
                imgprovider: _imgprovider, isarchive: isArchived ?? false),
          ),
        );
      },
      child: SvgPicture.asset(
        "assets/images/logofinal2.svg",
        height: 30,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
