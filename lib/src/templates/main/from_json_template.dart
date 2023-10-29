import 'package:vexana_gen/src/core/shared/abstract/template.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';
import 'package:analyzer/dart/element/element.dart';

class FromJsonTemplate extends Template {
  final List<VisitEntry> entries;
  final String className;

  FromJsonTemplate({
    required this.entries,
    required this.className,
  });

  @override
  String templated() {
    return """
  @override
  $className fromJson(Map<String,dynamic> json) { 
    return $className(
      ${_fieldRunner(entries)}
    );
  }
  """;
  }

  String _fieldRunner(List<VisitEntry> entries) {
    final buffer = StringBuffer();
    for (final entry in entries) {
      buffer.writeln(_fieldChecker(entry));
    }
    return buffer.toString();
  }

  String _fieldChecker(VisitEntry e) {
    if (e.isVexanaClass) {
      return _implTemplate(e.type, e.element?.name ?? '', e.isNullable);
    } else if (e.isEnumType) {
      return _enumTemplate(e);
    } else {
      return "${e.element?.name}:json['${e.element?.name}']${_nullabilitySuffix(e)},";
    }
  }

  String _nullabilitySuffix(VisitEntry e) => e.isNullable ? "" : "!";

  String _implTemplate(String className, String fieldName, bool isNullable) {
    final nullabilityPrefix =
        isNullable ? "json['$fieldName'] == null ? null :" : "";
    return "$fieldName: ${nullabilityPrefix}_${className}Impl.fromJson(json['$fieldName'] as Map<String,dynamic>),";
  }

  String _enumTemplate(VisitEntry e) {
    return "_${e.type}ToMap[json['${e.element?.type}']]${_nullabilitySuffix(e)},";
  }
}
