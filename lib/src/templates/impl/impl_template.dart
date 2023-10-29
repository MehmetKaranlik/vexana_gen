import 'package:vexana_gen/src/core/shared/abstract/template.dart';
import 'package:vexana_gen/src/generators/helpers/classes/visit_entry.dart';
import 'package:vexana_gen/src/templates/impl/final_field_template.dart';
import 'package:vexana_gen/src/templates/main/constructor_template.dart';
import 'package:vexana_gen/src/templates/impl/static_impl_from_json_template.dart';

class ImplTemplate extends Template {
  final String className;
  final List<VisitEntry> entries;
  ImplTemplate({required this.className, required this.entries});

  ConstructorTemplate get _constTemplate =>
      ConstructorTemplate(className: "_${className}Impl", entries: entries);
  FinalFieldTemplate get _fieldsTemplate =>
      FinalFieldTemplate(entries: entries);
  StaticImplFromJsonTemplate get _staticFromJsonTemplate {
    return StaticImplFromJsonTemplate(className: className, entries: entries);
  }

  @override
  String templated() {
    return """class _${className}Impl { 
      ${_constTemplate.templated()}
      ${_fieldsTemplate.templated()}
      ${_staticFromJsonTemplate.templated()}
    }""";
  }
}
