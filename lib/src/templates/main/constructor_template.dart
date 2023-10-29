import 'package:vexana_gen/src/core/shared/abstract/template.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';

class ConstructorTemplate extends Template {
  final String className;
  final List<VisitEntry> entries;

  ConstructorTemplate({required this.className, required this.entries});

  @override
  String templated() {
    return """
    $className({
      ${_fieldRunner(entries)}
    });
  """;
  }

  String _fieldRunner(List<VisitEntry> entries) {
    final buffer = StringBuffer();
    for (final entry in entries) {
      final requiredPrefix = entry.isNullable ? "" : "required";
      buffer.writeln("$requiredPrefix this.${entry.element?.name},");
    }
    return buffer.toString();
  }
}
