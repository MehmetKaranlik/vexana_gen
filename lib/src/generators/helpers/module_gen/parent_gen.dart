import 'package:vexana_gen/src/generators/helpers/model_visitor.dart';
import 'package:vexana_gen/src/utility/extensions/string_extension.dart';

class ParentGen {
  ParentGen();

  final StringBuffer buffer = StringBuffer();

  String generate(String className, Map<String, VisitEntry> entries) {
    _genClassName(className);
    _genConstructor(className, entries);
    _genFields(entries);
    _genFromJson(className, entries);
    _genToJson(entries);
    _genClassEnd();
    return buffer.toString();
  }

  void _genClassName(String className) {
    final stripped = className.removeStar;
    buffer.writeln(
        'abstract class  _\$${stripped}Serialized implements INetworkModel<$stripped> { \n');
  }

  void _genConstructor(String className, Map<String, VisitEntry> entry) {
    final stripped = className.removeStar;
    buffer.writeln('  _\$${stripped}Serialized({');
    for (final field in entry.values) {
      final prefix = field.isNullable ? '' : 'required';
      buffer.writeln('$prefix this.${field.element.name},');
    }
    buffer.writeln('  }) \n;');
  }

  void _genFields(Map<String, VisitEntry> entries) {
    for (final field in entries.values) {
      buffer.writeln('  final  ${field.type} ${field.element.name};');
    }
    buffer.writeln('\n');
  }

  void _genFromJson(String className, Map<String, VisitEntry> entries) {
    buffer.writeln('  @override');
    buffer.writeln(
        '  ${className.removeStar.removeQuestionMark} fromJson(Map<String, dynamic> json) {');
    buffer.writeln('    return $className(');
    for (final field in entries.values) {
      final normalDeclaration =
          'json[\'${field.element.name}\'] as ${field.type}';
      final declaration = field.isVexanaClass
          ? '_${field.type.removeQuestionMark.removeStar}Impl.fromJson(json[\'${field.element.name}\'] as Map<String, dynamic>)'
          : normalDeclaration;
      buffer.writeln('${field.element.name}:$declaration,');
    }
    buffer.writeln(');');
    buffer.writeln('}\n');
  }

  void _genToJson(Map<String, VisitEntry> entries) {
    buffer.writeln('  @override');
    buffer.writeln('  Map<String, dynamic> toJson() {');
    buffer.writeln('    return <String, dynamic>{');
    for (final field in entries.values) {
      buffer.writeln('      \'${field.element.name}\': ${field.element.name},');
    }
    buffer.writeln('    };');
    buffer.writeln('  }\n');
  }

  void _genClassEnd() {
    buffer.writeln('} \n');
  }
}
