import 'package:vexana_gen/src/core/shared/abstract/template.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';
import 'package:vexana_gen/src/utility/extensions/string_extension.dart';

class StaticImplFromJsonTemplate extends Template {
  final String className;
  final List<VisitEntry> entries;

  StaticImplFromJsonTemplate({
    required this.className,
    required this.entries,
  });

  @override
  String templated() {
    return """
  static $className fromJson(Map<String,dynamic> json) { 
    return $className(
      ${_fieldRunner(entries)}
    );
  }
""";
  }

  String _fieldRunner(List<VisitEntry> entries) {
    final buffer = StringBuffer();
    for (final entry in entries) {
      buffer.writeln(_fromJsonFieldDeclaration(entry));
    }
    return buffer.toString();
  }

  String _fromJsonFieldDeclaration(VisitEntry entry) {
    if (entry.isVexanaClass) {
      return _vexanaClassDeclaration(entry);
    } else if (entry.isEnumType) {
      return _enumDeclaration(entry);
    }
    return _primitiveFieldDeclaration(entry);
  }

  String _nullCheckDeclaration(VisitEntry e) =>
      "json['${e.element?.name}'] == null ? null :";

  String _vexanaClassDeclaration(VisitEntry e) {
    if (e.isNullable) {
      return '$_nullCheckDeclaration(e) $_vexanaImplDeclaration(e)';
    }
    return _vexanaImplDeclaration(e);
  }

  String _vexanaImplDeclaration(VisitEntry e) {
    return "_${e.type.removeQuestionMark.removeStar}Impl.fromJson(json['${e.element?.name}'] as Map<String, dynamic>)";
  }

  String _primitiveFieldDeclaration(VisitEntry e) {
    return "${e.element?.name}: json['${e.element?.name}'] as ${e.type}";
  }

  String _nullabilitySuffix(VisitEntry e) => e.isNullable ? "" : "!";

  String _enumDeclaration(VisitEntry e) {
    return "_${e.type}ToMap[json['${e.element?.type}']]${_nullabilitySuffix(e)},";
  }
}
