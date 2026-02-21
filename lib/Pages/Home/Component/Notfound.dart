import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynote_app/Pages/Note/NotePage.dart';
import 'package:mynote_app/Provider/IMGPicker_provider.dart';
import 'package:provider/provider.dart';

class NotFound extends StatelessWidget {
  final bool isarchived;
  const NotFound({Key? key, this.isarchived = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _imgprovider = Provider.of<IMGPicker>(context);
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/notfound.svg", height: 170),
              const SizedBox(height: 15.0),
              Text(
                "No Matching note",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Note not Found :(",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotePage(
                        imgprovider: _imgprovider,
                        isarchive: isarchived,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  "Create a new note",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
