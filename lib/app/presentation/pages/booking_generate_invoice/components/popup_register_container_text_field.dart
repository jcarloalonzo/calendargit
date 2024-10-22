import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widgets/my_text.dart';
import '../../../widgets/textfield_general.dart';
import '../../../widgets/util/input_formatters.dart';

class RowContainerTextfield extends StatelessWidget {
  const RowContainerTextfield({
    super.key,
    required this.title,
    this.isEditable = true,
    this.widthContainer = 120,
    this.controller,
    this.onChanged,
    this.textInputType =
        const TextInputType.numberWithOptions(decimal: true, signed: false),
    this.inputFormattes,
    this.hintText,
  });
  final String title;
  final bool isEditable;
  final double widthContainer;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormattes;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          title,
          fontWeight: FontWeight.w600,
        ),
        MyTextField(
          isEnabled: isEditable,
          isObscure: !isEditable,
          widthContainer: widthContainer,
          controller: controller,
          textInputType: textInputType,
          inputFormatters: inputFormattes ?? InputFormatters.money,
          height: 35,
          onChanged: onChanged,
          hintText: hintText,
        ),
      ],
    );
  }
}
