// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_sub_class.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

mixin _$SubSubClassSerialized implements INetworkModel<SubSubClass> {
  Nested? get value;

  @override
  SubSubClass fromJson(Map<String, dynamic> json) {
    return SubSubClass(
      value: json['value'] == null
          ? null
          : _NestedImpl.fromJson(json['value'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'value': value,
    };
  }
}

class _NestedImpl {
  _NestedImpl({
    this.id,
  });
  final SubSubClass? id;
  static Nested fromJson(Map<String, dynamic> json) {
    return Nested(
      id: json['id'] == null
          ? null
          : _SubSubClassImpl.fromJson(json['id'] as Map<String, dynamic>),
    );
  }
}

class _SubSubClassImpl {
  _SubSubClassImpl({
    this.value,
  });
  final Nested? value;
  static SubSubClass fromJson(Map<String, dynamic> json) {
    return SubSubClass(
      value: json['value'] == null
          ? null
          : _NestedImpl.fromJson(json['value'] as Map<String, dynamic>),
    );
  }
}
