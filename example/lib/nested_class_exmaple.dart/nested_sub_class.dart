import 'package:vexana/vexana.dart';
import 'package:vexana_gen/vexana_gen.dart';
part 'nested_sub_class.g.dart';

@Vexana()
class NestedSubClass with _$NestedSubClassSerialized {
  @override
  final int? i;

  NestedSubClass({
    this.i,
  });
}
