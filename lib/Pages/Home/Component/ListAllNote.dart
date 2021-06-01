import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mynote_app/Model/NoteModel.dart';
import 'package:mynote_app/Pages/Home/Component/Emptynote.dart';
import 'package:mynote_app/Pages/Home/Component/NoteCard.dart';
import 'package:mynote_app/Pages/Home/Component/Notfound.dart';
import 'package:mynote_app/Provider/Note_provider.dart';
import 'package:provider/provider.dart';

class ListAllNote extends StatelessWidget {
  const ListAllNote({Key key, this.isarchived = false}) : super(key: key);
  final bool isarchived;
  @override
  Widget build(BuildContext context) {
    final _noteprovider = Provider.of<NoteProvider>(context);

    return Builder(builder: (context) {
      return FutureBuilder<List<NoteModel>>(
          future: isarchived
              ? _noteprovider.getArchivedNote()
              : _noteprovider.getAllNote(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false || snapshot.data.isEmpty) {
              return Emptynote(isarchived: isarchived);
            } else if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.hasError) {
              return const Expanded(
                  child: Center(child: CircularProgressIndicator()));
            }
            final List<NoteModel> notes = snapshot.data;
            final filterednote = notes
                .where((note) =>
                    (note.title
                        .toLowerCase()
                        .contains(_noteprovider.filter.toLowerCase())) ||
                    (note.note
                        .toLowerCase()
                        .contains(_noteprovider.filter.toLowerCase())))
                .toList();
            if (filterednote.isEmpty) {
              return NotFound(isarchived: isarchived);
            }
            return Expanded(
              child: StaggeredGridView.countBuilder(
                  itemCount: filterednote.length,
                  crossAxisCount: 4,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 9.0,
                  itemBuilder: (BuildContext context, int index) =>
                      NoteCard(note: filterednote[index]),
                  staggeredTileBuilder: (_) => const StaggeredTile.fit(2)),
            );
          });
    });
  }
}
