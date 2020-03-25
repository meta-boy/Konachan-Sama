// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'tagadapter.dart';

// // ************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class TagsAdapter extends TypeAdapter<Tags> {
//   @override
//   Tags read(BinaryReader reader) {
//     var numOfFields = reader.readByte();
//     var fields = <int, dynamic>{
//       for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Tags()..selectedTags = (fields[0] as List)?.cast<String>();
//   }

//   @override
//   void write(BinaryWriter writer, Tags obj) {
//     writer
//       ..writeByte(1)
//       ..writeByte(0)
//       ..write(obj.selectedTags);
//   }

//   @override
//   // TODO: implement typeId
//   int get typeId => throw UnimplementedError();
// }
