import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';
import 'package:vexana_gen/src/utility/extensions/string_extension.dart';

extension VstEntryExt on VisitEntry {
  bool isSameType(VisitEntry other) =>
      type.removeQuestionMark.removeStar ==
      other.type.removeQuestionMark.removeStar;
}
