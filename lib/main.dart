import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:outcome_app/app.dart';
import 'providers/card_note_data.dart';
import 'providers/hive_keys.dart';
import 'providers/note_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Hive.initFlutter();
  Hive.registerAdapter<NoteData>(NoteDataAdapter());
  Hive.registerAdapter(CardNoteDataAdapter());
  await Hive.openBox<NoteData>(HiveKeys.notesKey);
  await Hive.openBox<CardNoteData>(HiveKeys.cardNotesKey);

  runApp(const MyApp());
}
