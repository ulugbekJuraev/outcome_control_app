import 'package:hive_flutter/hive_flutter.dart';
import 'package:outcome_app/providers/card_note_data.dart';


import 'hive_keys.dart';
import 'note_data.dart';

abstract class HiveBoxes {
  static final Box<NoteData> notes = Hive.box(HiveKeys.notesKey);
  static final Box<CardNoteData> cardNotes = Hive.box(HiveKeys.cardNotesKey);
}
