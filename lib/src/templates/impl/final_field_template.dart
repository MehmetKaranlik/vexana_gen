import 'package:vexana_gen/src/core/shared/abstract/template.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';

class FinalFieldTemplate extends Template {
  final List<VisitEntry> entries;

  FinalFieldTemplate({required this.entries});
  @override
  String templated() {
    return """
    ${_fieldRunner(entries)}
    """;
  }

  String _fieldRunner(List<VisitEntry> entries) {
    final buffer = StringBuffer();
    for (final entry in entries) {
      buffer.writeln(" final ${entry.type}  ${entry.element?.name};");
    }
    return buffer.toString();
  }
}
