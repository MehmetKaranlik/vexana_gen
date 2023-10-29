import 'package:vexana_gen/src/core/shared/abstract/template.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:vexana_gen/src/utility/extensions/enum_element_extensions.dart';
import 'package:vexana_gen/src/utility/extensions/dart_object_extension.dart';

class EnumTemplate extends Template {
  final String enumName;
  final List<Element> fields;
  EnumTemplate({required this.enumName, required this.fields});

  @override
  String templated() {
    return """
    const _${enumName}ToMap = { 
      ${fields.map((e) => _getVexanaValue).toList()}
    }
  """;
  }

  String _getVexanaValue(Element e) {
    final anno = e.metadata.firstWhere((element) => e.isAnnotatedByVexanaValue);
    final value = anno.computeConstantValue()?.getField("name");
    return "${value?.objcValue}:$enumName.${e.name},";
  }
}
