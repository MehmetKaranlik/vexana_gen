import 'package:example/sub_sub_class.dart';
import 'package:vexana/vexana.dart';
import 'package:vexana_gen/vexana_gen.dart';
part 'nested.g.dart';

@Vexana()
class Nested with _$NestedSerialized {
  Nested({this.id});

  @override
  final SubSubClass? id;
}
