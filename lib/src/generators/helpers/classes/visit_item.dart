import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';

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
