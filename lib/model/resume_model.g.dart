// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResumeModelAdapter extends TypeAdapter<ResumeModel> {
  @override
  final int typeId = 0;

  @override
  ResumeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResumeModel(
      email: fields[1] as String,
      name: fields[0] as String,
      about: fields[5] as String,
      education: fields[7] as String,
      experience: fields[6] as String,
      location: fields[4] as String,
      other: fields[8] as String,
      phoneNo: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ResumeModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phoneNo)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.about)
      ..writeByte(6)
      ..write(obj.experience)
      ..writeByte(7)
      ..write(obj.education)
      ..writeByte(8)
      ..write(obj.other);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResumeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
