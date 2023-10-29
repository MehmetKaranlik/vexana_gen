// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_sub_class.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

mixin _$NestedSubClassSerialized implements INetworkModel<NestedSubClass> {
  int? get i;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'i': i,
    };
  }

  @override
  NestedSubClass fromJson(Map<String, dynamic> json) {
    return NestedSubClass(
      i: json['i'],
    );
  }
}
