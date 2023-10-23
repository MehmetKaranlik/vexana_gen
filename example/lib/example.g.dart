// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

abstract class _$MainClassSerialized implements INetworkModel<MainClass> {
  _$MainClassSerialized({
    this.name,
    this.age,
    this.score,
    this.mahmut,
  });
  final String? name;
  final int? age;
  final double? score;
  final SubClass? mahmut;

  @override
  MainClass fromJson(Map<String, dynamic> json) {
    return MainClass(
      name: json['name'] as String?,
      age: json['age'] as int?,
      score: json['score'] as double?,
      mahmut: _SubClassImpl.fromJson(json['mahmut'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'score': score,
      'mahmut': mahmut,
    };
  }
}

class _SubClassImpl {
  _SubClassImpl({
    this.name,
  });
  final String? name;
}
