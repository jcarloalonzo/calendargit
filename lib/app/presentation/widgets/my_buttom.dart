// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../config/app_config/palette.dart';
import '../../../config/app_config/size_text.dart';

class MyButtom extends StatelessWidget {
  const MyButtom(this.text,
      {super.key,
      this.onTap,
      this.color = Palette.primaryColor,
      this.colorText = Colors.white,
      this.textSize,
      this.width = 150,
      this.sizeText = SizeText.text4,
      this.icono,
      this.colorIcono = Palette.white,
      this.sizeIcon = 15,
      this.height = 50,
      this.isLoading = false,
      this.bordeColor});
  final String text;
  final Function()? onTap;
  final Color? color;
  final Color? colorText;
  final String? textSize;
  final double width;
  final double? sizeText;
  final IconData? icono;
  final Color? colorIcono;
  final double? sizeIcon;
  final double height;
  final bool isLoading;
  final Color? bordeColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          elevation: 2,
          // shadowColor: Palette.primaryColor,
          minimumSize: Size(width, height),
          // primary: color,
          backgroundColor: color,
          // onPrimary: Colors.white,
          side: (bordeColor != null)
              ? BorderSide(width: 0.7, color: bordeColor!)
              : null,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (icono != null)
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: Icon(
                icono,
                color: colorIcono,
                size: sizeIcon,
              ),
            ),
          Flexible(
            child: Center(
              child: (isLoading)
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        fontSize: sizeText,
                        fontWeight: FontWeight.w700,
                        color: colorText,
                        fontFamily: 'Roboto',
                      ),
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
