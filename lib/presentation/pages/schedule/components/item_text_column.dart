import 'package:flutter/material.dart';

import '../../../../core/config/size_text.dart';
import '../../../widgets/my_text.dart';

class ItemTextColumn extends StatelessWidget {
  const ItemTextColumn({
    Key? key,
    this.onTap,
    required this.title,
    required this.colorIcon,
    required this.icono,
  }) : super(key: key);
  final Function()? onTap;
  final String title;
  final Color colorIcon;
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icono,
            color: colorIcon,
            size: 35,
          ),
          MyText(
            size: SizeText.text5,
            maxLines: 3,
            fontWeight: FontWeight.w600,
            text: title,
          ),
        ],
      ),
    );
  }
}
