import 'package:vexana_gen/src/generators/helpers/model_visitor.dart';

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
    _className = visitor.className;
    _fields = visitor.fields;
  }

  String generate() {
    _genClassStart();
    _genConstructor();
    _genFields();
    _genClassEnd();
    return buffer.toString();
  }

  void _genClassStart() {
    buffer.writeln("class _${_className}Impl {");
  }

  void _genConstructor() {
    buffer.writeln("  _${_className}Impl({");
    for (final field in _fields.values) {
      buffer.writeln("    this.${field.element.name},");
    }
    buffer.writeln("  });");
  }

  void _genFields() {
    for (final field in _fields.values) {
      buffer.writeln("  final ${field.type} ${field.element.name};");
    }
  }

  void _genClassEnd() {
    buffer.writeln("}");
  }
}
