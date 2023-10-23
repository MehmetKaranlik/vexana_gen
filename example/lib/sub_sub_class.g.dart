// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_sub_class.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

abstract class _$SubSubClassSerialized implements INetworkModel<SubSubClass> {
  _$SubSubClassSerialized({
    this.value,
  });
  final int? value;

  @override
  SubSubClass fromJson(Map<String, dynamic> json) {
    return SubSubClass(
      value: json['value'] as int?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'value': value,
    };
  }
}
