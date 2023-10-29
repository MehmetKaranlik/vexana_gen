import 'package:vexana_gen/src/generators/helpers/visitor/model_visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class VisitEntry {
  final String type;
  final bool isVexanaKeyAnnotated;
  final bool isVexanaClass;
  final bool isNullable;
  final FieldElement? element;
  final EnumElement? enumElement;
  final bool isEnumType;

  VisitEntry({
    required this.type,
    required this.isVexanaKeyAnnotated,
    required this.element,
    required this.isVexanaClass,
    required this.isEnumType,
    required this.enumElement,
    this.isNullable = false,
  });

  List<VisitEntry> getElements() {
    final visitor = ModelVisitor();
    element?.type.element?.visitChildren(visitor);
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
