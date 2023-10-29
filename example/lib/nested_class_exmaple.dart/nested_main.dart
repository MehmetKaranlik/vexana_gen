import 'package:example/nested_class_exmaple.dart/nested_sub_class.dart';
import 'package:vexana/vexana.dart';
import 'package:vexana_gen/vexana_gen.dart';
part 'nested_main.g.dart';

@Vexana()
class NestedMain with _$NestedMainSerialized {
  @override
  final NestedSubClass subClass;

  NestedMain({
    required this.subClass,
  });
}
