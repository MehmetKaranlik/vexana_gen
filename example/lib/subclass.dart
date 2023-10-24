import 'package:example/nested.dart';
import 'package:example/sub_sub_class.dart';
import 'package:vexana/vexana.dart';
import 'package:vexana_gen/vexana_gen.dart';
part 'subclass.g.dart';

@Vexana()
class SubClass with _$SubClassSerialized {
  SubClass({
    this.name,
    this.surname,
  });
  @override
  final String? name;

  @override
  final SubSubClass? surname;
}
