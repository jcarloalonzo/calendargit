import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/config/palette.dart';
import 'my_text.dart';

class TextFieldGeneral extends StatelessWidget {
  const TextFieldGeneral(
      {Key? key,
      required this.hintext,
      this.prefixIcon,
      this.onChanged,
      this.obscureText,
      this.focusNode,
      this.maxLength,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.margin = const EdgeInsets.all(0.0),
      this.suffixIcon,
      this.controller})
      : super(key: key);
  final String hintext;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final EdgeInsetsGeometry margin;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText ?? false,
        maxLength: maxLength,
        focusNode: focusNode,
        textInputAction: textInputAction,
        onChanged: onChanged,
        decoration: InputDecoration(
          // filled: true,
          hintStyle: const TextStyle(
            fontSize: 15.0,
            letterSpacing: 0.5,
            color: Palette.naturalGray,
          ),
          contentPadding: const EdgeInsets.all(15.0),
          isCollapsed: true,
          isDense: true,
          prefixIcon: prefixIcon,
          hintText: hintext,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.grey, width: 1.0),
          // ),
        ),
      ),
    );
  }
}

class WidgetInfoText extends StatelessWidget {
  const WidgetInfoText(
      {Key? key,
      required this.label,
      this.value = '',
      this.iconcheck = false,
      this.trailing})
      : super(key: key);
  final String label;
  final String value;
  final bool iconcheck;
  final VoidCallback? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          color: Color(0xff2A2A2A),
          fontWeight: FontWeight.w700,
          fontFamily: 'Source Sans Pro',
        ),
      ),
      subtitle: iconcheck
          ? Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff666666),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
                const SizedBox(width: 5),
              ],
            )
          : value == ''
              ? null
              : Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff666666),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
      trailing: trailing == null
          ? null
          : IconButton(
              onPressed: trailing,
              icon: const Icon(
                Icons.keyboard_arrow_right,
              ),
              iconSize: 32,
            ),
    );
  }
}

class WidgetInfoTextField extends StatelessWidget {
  const WidgetInfoTextField(
      {Key? key, required this.label, this.helper, this.action, this.change})
      : super(key: key);
  final String label;
  final String? helper;
  final TextInputAction? action;
  final Function(String)? change;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontFamily: 'Source Sans Pro',
        ),
      ),
      subtitle: TextField(

          //cursorColor: Color(Config.primaryColor),
          onChanged: change,
          decoration: InputDecoration(
            errorText: null,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            helperText: helper,
          ),
          obscureText: true,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xff999999),
            fontFamily: 'Source Sans Pro',
          ),
          textInputAction: action),
    );
  }
}

class MyTextFieldContainer extends StatelessWidget {
  const MyTextFieldContainer({
    Key? key,
    this.title,
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
    this.isPassword = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);
  final String? title;
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
  final bool isObscure;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPassword;
  final TextCapitalization textCapitalization;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: (isObscure) ? const Color(0xffDADADA) : Palette.white,
          border: Border.all(color: (Colors.grey.shade500)),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        height: (title != null) ? null : 69,
        width: widthContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Container(
                height: 15,
                margin: const EdgeInsets.only(left: 11, top: 4),
                child: Row(
                  children: [
                    MyText(
                      text: title!,
                      fontWeight: FontWeight.w400,
                      size: 12,
                      color: const Color(0xff223263),
                    ),
                    if (isImportantFormRed)
                      const MyText(
                        text: ' *',
                        fontWeight: FontWeight.w400,
                        size: 16,
                        color: Colors.red,
                      ),
                  ],
                ),
              ),
            TextField(
              inputFormatters: inputFormatters,
              maxLength: (maxLength > 0) ? maxLength : null,
              maxLengthEnforcement: (maxLength > 0)
                  ? MaxLengthEnforcement.enforced
                  : MaxLengthEnforcement.none,
              keyboardType: textInputType,
              onTap: onTapTextField,
              obscureText: isPassword,
              enabled: isEnabled,
              maxLines: maxLines,
              minLines: minLines,
              textAlign: textAlign,
              onChanged: onChanged,
              controller: controller,
              onSubmitted: onSubmitted,
              textInputAction: action,
              textCapitalization: textCapitalization,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: colorTextField,
              ),
              decoration: InputDecoration(
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10),
                //   borderSide: BorderSide.none,
                // ),
                border: InputBorder.none,
                fillColor: Colors.transparent,

                filled: true,
                suffixIcon: suffixIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
