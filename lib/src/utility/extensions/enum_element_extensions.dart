import 'package:analyzer/dart/element/element.dart';

extension EnmElementExt on Element {
  bool get isAnnotatedByVexanaValue => metadata.any((element) =>
      element.computeConstantValue()?.type.toString() == "VexanaValue");
}
