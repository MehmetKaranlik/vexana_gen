import 'package:vexana_gen/src/core/shared/abstract/template.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';

class ToJsonTemplate extends Template {
  final List<VisitEntry> entries;

  ToJsonTemplate({required this.entries});

  @override
  String templated() {
    return """Map<String,dynamic> toJson() { 
    return <String,dynamic> { 
        ${_fieldRunner(entries)}
      };
    }""";
  }

  String _fieldRunner(List<VisitEntry> entries) {
    final buffer = StringBuffer();
    for (final entry in entries) {
      buffer.writeln("'${entry.element?.name}': ${entry.element?.name},");
    }
    return '$buffer';
  }
}
