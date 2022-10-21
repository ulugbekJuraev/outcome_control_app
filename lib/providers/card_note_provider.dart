import 'package:flutter/cupertino.dart';
import 'package:outcome_app/providers/card_note_data.dart';

import 'hive_boxes.dart';


class CardNoteProvider extends ChangeNotifier {
  TextEditingController typeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  FixedExtentScrollController scrollController = FixedExtentScrollController();
  final String typeName = '';

  void addCardNote(typeName) async {
    await HiveBoxes.cardNotes.add(
      CardNoteData(
        type: typeName,
        price: priceController.text,

      ),
    );
    notifyListeners();
  }


}

