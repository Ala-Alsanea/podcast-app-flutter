// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:podcast_app/Config/style.dart';

Widget FormError({List? errors}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: List.generate(
      errors!.length,
      (index) => Text(
        errors[index],
        style: bold_16(color: Colors.red),
      ),
    ),
  );
}
