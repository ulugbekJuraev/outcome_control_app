// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_note_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardNoteDataAdapter extends TypeAdapter<CardNoteData> {
  @override
  final int typeId = 1;

  @override
  CardNoteData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardNoteData(
      type: fields[0] as String,
      price: fields[2] as String,
    )..date = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, CardNoteData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardNoteDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
