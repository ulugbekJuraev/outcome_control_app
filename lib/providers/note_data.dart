import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'note_data.g.dart';

@HiveType(typeId: 0)
class NoteData {
  @HiveField(0)
  final String type;

  @HiveField(1)
  late String date;

  @HiveField(2)
  final String price;

  NoteData({
    required this.type,
    required this.price,

  }) {
    final nowTime = DateTime.now();
    date = DateFormat('dd.MM.yyyy').format(nowTime);
  }
}
