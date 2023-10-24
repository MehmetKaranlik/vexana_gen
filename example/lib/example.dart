// ignore_for_file: overridden_fields

import 'package:example/nested.dart';
import 'package:example/sub_sub_class.dart';
import 'package:example/subclass.dart';
import 'package:vexana_gen/vexana_gen.dart';
import 'package:vexana/vexana.dart';
part 'example.g.dart';

@Vexana()
class MainClass with _$MainClassSerialized {
  MainClass({
    this.name,
    this.age,
    required this.score,
    required this.subClass,
  });

  @VexanaKey()
  @override
  final String? name;

  @override
  final int? age;

  @override
  final double score;

  @override
  final SubClass subClass;
}
