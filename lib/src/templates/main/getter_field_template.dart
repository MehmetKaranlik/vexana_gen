import 'package:vexana_gen/src/core/shared/abstract/template.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';

class GetterFieldTemplate extends Template {
  GetterFieldTemplate({required this.entries});
  final List<VisitEntry> entries;

  @override
  String templated() {
    return """
    ${_fieldRunner(entries)}
    """;
  }

  String _fieldRunner(List<VisitEntry> entries) {
    final buffer = StringBuffer();
    for (final entry in entries) {
      buffer.writeln("${entry.type} get ${entry.element?.name};");
    }
    return buffer.toString();
  }
}
