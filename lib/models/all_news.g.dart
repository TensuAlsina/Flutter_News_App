// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllNewsAdapter extends TypeAdapter<AllNews> {
  @override
  final int typeId = 0;

  @override
  AllNews read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllNews(
      author: fields[0] as String,
      content: fields[1] as String,
      date: fields[2] as String,
      imageUrl: fields[3] as String,
      time: fields[4] as String,
      title: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AllNews obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllNewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
