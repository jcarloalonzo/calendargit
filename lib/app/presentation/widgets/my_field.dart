import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/app_config/palette.dart';
import 'my_text.dart';

class MyField extends StatelessWidget {
  const MyField({
    super.key,
    this.title,
    this.svgPath,
    this.onSubmitted,
    this.onChanged,
    this.controller,
    this.isEnabled = true,
    this.textAlign = TextAlign.start,
    this.onTap,
    this.onTapTextField,
    this.textInputType = TextInputType.text,
    this.hintText,
    this.backgroundColor = Colors.white,
    this.isImportantFormRed = false,
    this.suffixIcon,
    this.widthContainer = double.infinity,
    this.colorTextField = const Color(0xff223263),
    this.action = TextInputAction.next,
    this.maxLength = 0,
    this.prefix,
    this.prefixText,
    this.maxLines = 1,
    this.minLines = 1,
    this.isObscure = false,
    this.inputFormatters,
    this.isPassword = false,
    this.height = 55,
    this.textCapitalization = TextCapitalization.none,
    this.colorTitle = Palette.primaryColor,
    required this.text,
  });
  final String? title;
  final String? svgPath;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onTapTextField;
  final TextEditingController? controller;
  final bool isEnabled;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final String? hintText;
  final Color backgroundColor;
  final bool isImportantFormRed;
  final Widget? suffixIcon;
  final double widthContainer;
  final Color colorTextField;
  final TextInputAction action;
  final int maxLength;
  final Widget? prefix;
  final String? prefixText;
  final int maxLines;
  final int minLines;
  final bool isPassword;
  final double height;
  final bool isObscure;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final Color colorTitle;

  //
  //
  //
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:
              (isObscure) ? Color.fromARGB(255, 244, 244, 244) : Palette.white,
          border: Border.all(width: 0.3, color: (Colors.grey.shade500)),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        height: height,
        width: widthContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Container(
                height: 15,
                margin: const EdgeInsets.only(left: 11, top: 4),
                child: Row(
                  children: [
                    MyText(
                      title!,
                      fontWeight: FontWeight.w500,
                      size: 12,
                      color: colorTitle,
                    ),
                    if (isImportantFormRed)
                      const MyText(
                        ' *',
                        fontWeight: FontWeight.w400,
                        size: 16,
                        color: Colors.red,
                      ),
                  ],
                ),
              ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
