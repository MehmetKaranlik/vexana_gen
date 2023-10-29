// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_main.dart';

// **************************************************************************
// VexanaSerializableGenerator
// **************************************************************************

mixin _$NestedMainSerialized implements INetworkModel<NestedMain> {
  NestedSubClass get subClass;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subClass': subClass,
    };
  }

  @override
  NestedMain fromJson(Map<String, dynamic> json) {
    return NestedMain(
      subClass: _NestedSubClassImpl.fromJson(
          json['subClass'] as Map<String, dynamic>),
    );
  }
}

class _NestedSubClassImpl {
  _NestedSubClassImpl({
    this.i,
  });

  final int? i;

  static NestedSubClass fromJson(Map<String, dynamic> json) {
    return NestedSubClass(i: json['i'] as int?);
  }
}
