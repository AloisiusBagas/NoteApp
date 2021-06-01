import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynote_app/Pages/Note/NotePage.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';
import 'package:provider/provider.dart';

class Emptynote extends StatelessWidget {
  final bool isarchived;
  const Emptynote({
    Key key,
    this.isarchived = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _imgprovider = Provider.of<IMGPicker>(context);
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/Empty.svg", height: 180),
              const SizedBox(height: 9.0),
              Text(
                "Looks like empty here",
                style: Theme.of(context).textTheme.headline2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                    "You have not created any note\ntap the button to add your first note",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen, // background
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotePage(
                            imgprovider: _imgprovider,
                            isarchive: isarchived,
                          )));
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: const Text(
                  "Create a new note",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
