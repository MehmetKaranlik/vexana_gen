// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:vexana_gen/src/annotations/vexana_annotation.dart';
import 'package:vexana_gen/src/generators/helpers/model_visitor.dart';
import 'package:vexana_gen/src/generators/helpers/module_gen/impl_gen.dart';
import 'package:vexana_gen/src/generators/helpers/module_gen/parent_gen.dart';

class VexanaSerializableGenerator extends GeneratorForAnnotation<Vexana> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();

    // PARENT CLASS
    final parentGen = ParentGen().generate(visitor.className, visitor.fields);
    buffer.writeln(parentGen);

    // IMPL CLASSES
    for (final field in visitor.fields.values) {
      if (!field.isVexanaClass) continue;
      final implGen = ImplGen(entry: field);
      buffer.writeln(implGen.generate());
    }

    return buffer.toString();
  }
}
