import 'package:analyzer/dart/element/element.dart';

extension AnnoExt on ElementAnnotation {
  bool get isVexanaKeyAnnotated =>
      computeConstantValue()?.type.toString() == "VexanaKey";
  bool get isVexanaAnnotated =>
      computeConstantValue()?.type.toString() == "VexanaClass";
  bool get isVexanaValueAnnotated =>
      computeConstantValue()?.type.toString() == "VexanaValue";
}
