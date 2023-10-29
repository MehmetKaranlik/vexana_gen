import 'package:analyzer/dart/constant/value.dart';

extension DartObjcExt on DartObject {
  String get objcValue {
    final firstIndex = toString().indexOf("(");
    final lastIndex = toString().indexOf(")");
    if (firstIndex != -1 && lastIndex != -1) {
      return toString().substring(firstIndex + 1, lastIndex);
    }
    return toString();
  }
}
