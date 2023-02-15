import 'package:calendario/core/config/palette.dart';
import 'package:calendario/core/config/size_text.dart';
import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
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
  const MyButtom(
      {Key? key,
      required this.text,
      this.onTap,
      this.color = Palette.colorApp,
      this.colorText = Colors.white,
      this.textSize,
      this.width = 150,
      this.sizeText = SizeText.text4,
      this.icono,
      this.colorIcono = Palette.white,
      this.sizeIcon = 15,
      this.height = 40,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, elevation: 2, backgroundColor: color,
          shadowColor: Palette.colorApp,
          minimumSize: Size(width, height),
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
                      child:   CircularProgressIndicator(),
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

        //  ElevatedButton(
        //           onPressed: () {},
        //           style: ElevatedButton.styleFrom(
        //               elevation: 2,
        //               shadowColor: Palette.colorApp,
        //               minimumSize: Size(150, 40),
        //               primary: Colors.white,
        //               onPrimary: Colors.white,
        //               shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(8))),
        //           child: Text(
        //             'Microfono',
        //             style: TextStyle(
        //               fontSize: SizeText.text4,
        //               fontWeight: FontWeight.bold,
        //               color: Palette.colorApp,
        //               fontFamily: "Source Sans Pro",
        //             ),
        //             textAlign: TextAlign.center,
        //           ),
        //         ),