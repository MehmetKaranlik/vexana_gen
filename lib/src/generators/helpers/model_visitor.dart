import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:vexana_gen/src/utility/extensions/field_element_extensions.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = "";
  Map<String, VisitEntry> fields = {};

  @override
  void visitConstructorElement(ConstructorElement element) {
    className = element.returnType.toString().replaceFirst("*", "");
  }

  @override
  void visitFieldElement(FieldElement element) {
    fields[element.name] = VisitEntry(
      type: element.type.toString(),
      isVexanaKeyAnnotated: element.isVexanaKeyAnnotated,
      isVexanaClass: element.isVexanaAnnotated,
      isNullable: element.isNullable,
      element: element,
    );
  }
}

class VisitEntry {
  final String type;
  final bool isVexanaKeyAnnotated;
  final bool isVexanaClass;
  final bool isNullable;
  final FieldElement element;

  VisitEntry({
    required this.type,
    required this.isVexanaKeyAnnotated,
    required this.element,
    required this.isVexanaClass,
    this.isNullable = false,
  });
}
