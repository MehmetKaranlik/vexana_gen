// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subclass.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

mixin _$SubClassSerialized implements INetworkModel<SubClass> {
  String? get name;
  SubSubClass? get surname;

  @override
  SubClass fromJson(Map<String, dynamic> json) {
    return SubClass(
      name: json['name'] as String?,
      surname: json['surname'] == null
          ? null
          : _SubSubClassImpl.fromJson(json['surname'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'surname': surname?.toJson(),
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
