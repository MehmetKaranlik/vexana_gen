import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_item.dart';
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
    final isEnum = element.type.element is EnumElement;
    item.fields[element.name] = VisitEntry(
      type: element.type.toString().removeStar,
      isVexanaKeyAnnotated: element.isVexanaKeyAnnotated,
      isVexanaClass: element.isVexanaAnnotated,
      isNullable: element.isNullable,
      isEnumType: isEnum,
      element: element,
      enumElement: isEnum ? element.type.element as EnumElement : null,
    );
  }
}
