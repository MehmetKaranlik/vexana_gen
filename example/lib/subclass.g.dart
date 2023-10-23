// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subclass.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

abstract class _$SubClassSerialized implements INetworkModel<SubClass> {
  _$SubClassSerialized({
    this.name,
    this.surname,
  });
  final String? name;
  final String? surname;

  @override
  SubClass fromJson(Map<String, dynamic> json) {
    return SubClass(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
    };
  }
}
