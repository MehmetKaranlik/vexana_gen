// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

mixin _$MainClassSerialized implements INetworkModel<MainClass> {
  String? get name;
  int? get age;
  double get score;
  SubClass get subClass;

  @override
  MainClass fromJson(Map<String, dynamic> json) {
    return MainClass(
      name: json['name'] as String?,
      age: json['age'] as int?,
      score: json['score'] as double,
      subClass:
          _SubClassImpl.fromJson(json['subClass'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'score': score,
      'subClass': subClass.toJson(),
    };
  }
}

class _SubClassImpl {
  _SubClassImpl({
    this.name,
    this.surname,
  });
  final String? name;
  final SubSubClass? surname;
  static SubClass fromJson(Map<String, dynamic> json) {
    return SubClass(
      name: json['name'] as String?,
      surname: json['surname'] == null
          ? null
          : _SubSubClassImpl.fromJson(json['surname'] as Map<String, dynamic>),
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
