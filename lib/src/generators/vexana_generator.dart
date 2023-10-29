// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:vexana_gen/src/annotations/vexana_annotation.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';
import 'package:vexana_gen/src/generators/helpers/visitor/model_visitor.dart';
import 'package:vexana_gen/src/templates/enum/enum_template.dart';
import 'package:vexana_gen/src/templates/impl/impl_template.dart';

import 'package:vexana_gen/src/templates/main/main_template.dart';
import 'package:vexana_gen/src/utility/extensions/list_extension.dart';
import 'package:vexana_gen/src/utility/extensions/visit_entry_extension.dart';

class VexanaSerializableGenerator extends GeneratorForAnnotation<Vexana> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final buffer = StringBuffer();
    // VISIT
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    final visitItem = visitor.item;

    final mainTemplate = MainTemplate(
      className: visitItem.className,
      entries: visitItem.fields.values.toList(),
    ).templated();
    buffer.writeln(mainTemplate);
    var entries = <VisitEntry>[];

    for (final field in visitItem.fields.values) {
      _getVexanaClassEntries(field, entries);
    }

    for (final entry in entries.unique((element) => element.type)) {
      if (entry.isEnumType) {
        final template = EnumTemplate(
          enumName: entry.type,
          fields: entry.element?.children ?? [],
        ).templated();
        buffer.writeln(template);
      } else if (entry.isVexanaClass) {
        final template = ImplTemplate(
          className: entry.type,
          entries: entry.getElements(),
        ).templated();
        buffer.writeln(template);
      }
    }

    return buffer.toString();
  }

  void _getVexanaClassEntries(VisitEntry entry, List<VisitEntry> entries) {
    entries.add(entry);
    final elements = entry.getElements();
    for (final item in elements) {
      if (!item.isVexanaClass && !item.isEnumType) continue;
      if (entries.any((element) => element.isSameType(item))) continue;
      _getVexanaClassEntries(item, entries);
    }
  }
}
