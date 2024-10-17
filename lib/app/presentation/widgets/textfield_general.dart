import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/app_config/palette.dart';
import 'my_text.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
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
      this.colorTitle = Palette.primaryColor});
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
            TextField(
              textCapitalization: textCapitalization,
              inputFormatters: inputFormatters,
              maxLength: (maxLength > 0) ? maxLength : null,
              maxLengthEnforcement: (maxLength > 0)
                  ? MaxLengthEnforcement.enforced
                  : MaxLengthEnforcement.none,
              keyboardType: textInputType,
              onTap: onTapTextField,
              enabled: isEnabled,
              maxLines: maxLines,
              minLines: minLines,
              textAlign: textAlign,
              cursorColor: Palette.primaryColor,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: colorTextField,
              ),
              obscureText: isPassword,
              decoration: InputDecoration(
                isDense: true,
                counterStyle: const TextStyle(
                  height: 0.5,
                  color: Palette.black2,
                  fontSize: 8,
                ),
                border: InputBorder.none,
                hintText: hintText,
                filled: true,
                fillColor: Colors.transparent,
                prefixText: prefixText,
                prefix: prefix,
                suffixIcon: suffixIcon,
              ),
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              controller: controller,
              textInputAction: action,
            ),
          ],
        ),
      ),
    );
  }
}
