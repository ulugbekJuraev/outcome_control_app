

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'card_note_data.g.dart';

@HiveType(typeId: 1)
class CardNoteData {
  @HiveField(0)
  final String type;

  @HiveField(1)
  late String date;

  @HiveField(2)
  final String price;



  CardNoteData({
    required this.type,
    required this.price,
  

  }) {
    final nowTime = DateTime.now();
    date = DateFormat('dd.MM.yyyy').format(nowTime);
  }
}
