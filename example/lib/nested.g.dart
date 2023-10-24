// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

mixin _$NestedSerialized implements INetworkModel<Nested> {
  SubSubClass? get id;

  @override
  Nested fromJson(Map<String, dynamic> json) {
    return Nested(
      id: json['id'] == null
          ? null
          : _SubSubClassImpl.fromJson(json['id'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
    };
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
