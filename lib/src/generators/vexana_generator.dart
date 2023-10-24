// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:vexana_gen/src/annotations/vexana_annotation.dart';
import 'package:vexana_gen/src/generators/helpers/model_visitor.dart';
import 'package:vexana_gen/src/generators/helpers/module_gen/impl_gen.dart';
import 'package:vexana_gen/src/generators/helpers/module_gen/parent_gen.dart';
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

    // PARENT CLASS
    final parentGen =
        ParentGen().generate(visitor.item.className, visitor.item.fields);
    buffer.writeln(parentGen);

    var entries = <VisitEntry>[];

    // IMPL CLASSES (PARENT VALUES)
    for (final entry in visitor.item.fields.values) {
      if (!entry.isVexanaClass) continue;
      _getEntries(entry, entries);
    }

    for (final item in entries.unique((element) => element.type)) {
      final implGen = ImplGen(entry: item).generate();
      buffer.writeln(implGen);
    }

    return buffer.toString();
  }

  void _getEntries(VisitEntry entry, List<VisitEntry> entries) {
    entries.add(entry);
    final elements = entry.getElements();
    for (final item in elements) {
      if (!item.isVexanaClass) continue;
      if (entries.any((element) => element.isSameType(item))) continue;
      _getEntries(item, entries);
    }
  }
}
