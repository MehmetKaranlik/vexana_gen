import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:vexana_gen/src/utility/extensions/field_element_extensions.dart';
import 'package:vexana_gen/src/utility/extensions/string_extension.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  final VisitItem item = VisitItem(className: "", fields: {});

  @override
  void visitConstructorElement(ConstructorElement element) {
    item.className = element.returnType.toString().replaceFirst("*", "");
  }

  @override
  void visitFieldElement(FieldElement element) {
    item.fields[element.name] = VisitEntry(
      type: element.type.toString().removeStar,
      isVexanaKeyAnnotated: element.isVexanaKeyAnnotated,
      isVexanaClass: element.isVexanaAnnotated,
      isNullable: element.isNullable,
      element: element,
    );
  }
}

class VisitItem {
  String className;
  Map<String, VisitEntry> fields;

  VisitItem({
    required this.className,
    required this.fields,
  });

  @override
  bool operator ==(covariant VisitItem other) {
    return other.className == className && other.fields == fields;
  }

  @override
  int get hashCode => className.hashCode;
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

  List<VisitEntry> getElements() {
    final visitor = ModelVisitor();
    element.type.element?.visitChildren(visitor);
    return visitor.item.fields.values.toList();
  }

  @override
  bool operator ==(covariant VisitEntry other) {
    return other.type == type &&
        other.isVexanaKeyAnnotated == isVexanaKeyAnnotated &&
        other.isVexanaClass == isVexanaClass &&
        other.isNullable == isNullable &&
        other.element == element;
  }

  @override
  String toString() => 'Class : $type entry';

  @override
  int get hashCode => type.hashCode;
}
