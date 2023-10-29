import 'package:vexana_gen/src/core/shared/abstract/template.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';
import 'package:vexana_gen/src/templates/main/from_json_template.dart';
import 'package:vexana_gen/src/templates/main/getter_field_template.dart';
import 'package:vexana_gen/src/templates/main/to_json_template.dart';

class MainTemplate extends Template {
  final String className;
  final List<VisitEntry> entries;

  MainTemplate({
    required this.className,
    required this.entries,
  });

  GetterFieldTemplate get _getterTemplate =>
      GetterFieldTemplate(entries: entries);
  FromJsonTemplate get _fromJson =>
      FromJsonTemplate(entries: entries, className: className);
  ToJsonTemplate get _toJson => ToJsonTemplate(entries: entries);

  @override
  String templated() {
    return """
  mixin _\$${className}Serialized implements INetworkModel<$className> { 
    ${_getterTemplate.templated()}
    ${_toJson.templated()}
    ${_fromJson.templated()}
  }
""";
  }
}
