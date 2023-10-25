import 'package:vexana_gen/src/generators/helpers/model_visitor.dart';
import 'package:vexana_gen/src/utility/extensions/string_extension.dart';

class ParentGen {
  ParentGen();

  final StringBuffer buffer = StringBuffer();

  String generate(String className, Map<String, VisitEntry> entries) {
    _genClassName(className);
    // _genConstructor(className, entries);
    _genFields(entries);
    _genFromJson(className, entries);
    _genToJson(entries);
    _genClassEnd();
    return buffer.toString();
  }

  void _genClassName(String className) {
    final stripped = className.removeStar;
    buffer.writeln(
      'mixin  _\$${stripped}Serialized implements INetworkModel<$stripped> { \n',
    );
  }

  void _genFields(Map<String, VisitEntry> entries) {
    for (final field in entries.values) {
      buffer.writeln('    ${field.type} get  ${field.element.name};');
    }
    buffer.writeln('\n');
  }

  void _genFromJson(String className, Map<String, VisitEntry> entries) {
    buffer.writeln('  @override');
    buffer.writeln(
        '  ${className.removeStar.removeQuestionMark} fromJson(Map<String, dynamic> json) {');
    buffer.writeln('return $className(');
    for (final entry in entries.values) {
      buffer.writeln(
          '${entry.element.name}:${_fromJsonFieldDeclaration(entry)},');
    }
    buffer.writeln(');');
    buffer.writeln('}\n');
  }

  void _genToJson(Map<String, VisitEntry> entries) {
    buffer.writeln('  @override');
    buffer.writeln('  Map<String, dynamic> toJson() {');
    buffer.writeln('    return <String, dynamic>{');
    for (final field in entries.values) {
      if (field.isVexanaClass) {
        final nameSuffix = field.isNullable ? '?' : '';
        buffer.writeln(
            ' \'${field.element.name}\': ${field.element.name}$nameSuffix.toJson(), ');
      } else {
        buffer.writeln('\'${field.element.name}\': ${field.element.name},');
      }
    }
    buffer.writeln('};');
    buffer.writeln('}\n');
  }

  void _genClassEnd() {
    buffer.writeln('} \n');
  }

  String _fromJsonFieldDeclaration(VisitEntry entry) {
    final nullCheckDec = "json['${entry.element.name}'] == null ? null :";
    final normalDeclaration = "json['${entry.element.name}'] as ${entry.type}";
    final nestedClassDeclaration =
        "_${entry.type.removeQuestionMark.removeStar}Impl.fromJson(json['${entry.element.name}'] as Map<String, dynamic>)";
    return entry.isVexanaClass
        ? entry.isNullable
            ? '$nullCheckDec $nestedClassDeclaration'
            : nestedClassDeclaration
        : normalDeclaration;
  }
}
