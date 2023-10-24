import 'package:vexana_gen/src/generators/helpers/model_visitor.dart';
import 'package:vexana_gen/src/utility/extensions/string_extension.dart';

class ImplGen {
  final VisitEntry entry;
  ImplGen({required this.entry}) {
    _init();
  }
  final buffer = StringBuffer();
  String _className = "";
  Map<String, VisitEntry> _fields = {};

  void _init() {
    final visitor = ModelVisitor();
    entry.element.type.element?.visitChildren(visitor);
    _className = visitor.item.className;
    _fields = visitor.item.fields;
  }

  String generate() {
    _genClassStart();
    _genConstructor();
    _genFields();
    _genFromJson();
    _genClassEnd();
    return buffer.toString();
  }

  void _genClassStart() {
    buffer.writeln("class _${_className}Impl {");
  }

  void _genConstructor() {
    buffer.writeln("  _${_className}Impl({");
    for (final field in _fields.values) {
      final dec = field.isNullable ? "" : "required";
      buffer.writeln(" $dec   this.${field.element.name},");
    }
    buffer.writeln("  });");
  }

  void _genFields() {
    for (final field in _fields.values) {
      buffer.writeln("  final ${field.type} ${field.element.name};");
    }
  }

  void _genFromJson() {
    buffer
        .writeln("  static $_className fromJson(Map<String, dynamic> json) {");
    buffer.writeln("    return $_className(");
    for (final field in _fields.values) {
      buffer.writeln(
          "${field.element.name}: ${_fromJsonFieldDeclaration(field)},");
    }
    buffer.writeln("    );");
    buffer.writeln("  }");
  }

  void _genToJson() {
    buffer.writeln("  Map<String, dynamic> toJson() {");
    buffer.writeln("    return <String, dynamic>{");
    for (final field in _fields.values) {
      String declaration = "";
      if (field.isVexanaClass) {
        declaration = "${field.element.name}?.toJson()";
      } else {
        declaration = field.element.name;
      }
      buffer.writeln("      '${field.element.name}': $declaration,");
    }
    buffer.writeln("    };");
    buffer.writeln("  }");
  }

  void _genClassEnd() {
    buffer.writeln("}");
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
