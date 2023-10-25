import 'package:example/nested.dart';
import 'package:vexana/vexana.dart';
import 'package:vexana_gen/vexana_gen.dart';

part 'sub_sub_class.g.dart';

@Vexana()
class SubSubClass with _$SubSubClassSerialized {
  SubSubClass({
    this.value,
  });
  @override
  final Nested? value;
}
