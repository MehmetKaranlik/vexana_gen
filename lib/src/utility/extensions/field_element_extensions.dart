import 'package:analyzer/dart/element/element.dart';

extension FieldElementExt on FieldElement {
  bool get isVexanaKeyAnnotated => metadata.any((element) =>
      element.computeConstantValue()?.type?.toString() == "VexanaKey");

  bool get isVexanaAnnotated =>
      type.element?.metadata.any((element) =>
          element.computeConstantValue()?.type.toString() == "Vexana") ??
      false;

  bool get isNullable => type.toString().replaceFirst('*', '').contains('?');
}
