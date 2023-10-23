// ignore_for_file: overridden_fields

import 'package:example/subclass.dart';
import 'package:vexana_gen/vexana_gen.dart';
import 'package:vexana/vexana.dart';
part 'example.g.dart';

@Vexana()
class MainClass extends _$MainClassSerialized {
  MainClass({
    this.name,
    this.age,
    this.score,
    this.mahmut,
  });

  @VexanaKey()
  @override
  final String? name;

  @override
  final int? age;

  @override
  final double? score;

  @override
  final SubClass? mahmut;
}
