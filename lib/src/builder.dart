// ignore_for_file: unused_import

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:vexana_gen/src/generators/vexana_generator.dart';
import 'annotations/index.dart';

Builder vexanaBuilder(BuilderOptions options) => SharedPartBuilder(
      [VexanaSerializableGenerator()],
      'vexana',
    );
