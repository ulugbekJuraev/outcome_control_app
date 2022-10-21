import 'package:flutter/cupertino.dart';
import 'hive_boxes.dart';
import 'note_data.dart';

class NoteProvider extends ChangeNotifier {
  TextEditingController typeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  FixedExtentScrollController scrollController = FixedExtentScrollController();
  final String typeName = '';

  void addNote(typeName) async {
    await HiveBoxes.notes.add(
      NoteData(
        type: typeName,
        price: priceController.text,
        ),
    );
    notifyListeners();
  }

}
