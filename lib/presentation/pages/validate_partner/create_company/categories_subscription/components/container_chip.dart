import 'package:flutter/material.dart';

import '../../../../../../core/config/palette.dart';
import '../../../../../../core/config/size_text.dart';
import '../../../../../widgets/my_text.dart';

class ContainerChip extends StatelessWidget {
  const ContainerChip(
    this.title, {
    Key? key,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);
  final bool isSelected;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(
          // color: Colors.white,
          color: isSelected ? Palette.colorApp : Palette.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            // color: isSelected ? Palette.primaryColor : Colors.grey,
            color: isSelected ? Palette.white : Palette.colorApp,
            width: 2,
          ),
        ),
        child: MyText(
          text: title,
          color: isSelected ? Palette.white : Palette.colorApp,
          // color: Palette.colorApp,
          fontWeight: FontWeight.w600,
          size: SizeText.text4,
        ),
      ),
    );
  }
}
