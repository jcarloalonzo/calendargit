import 'package:flutter/material.dart';

import '../../../../config/app_config/palette.dart';
import '../../../../generated/translations.g.dart';
import '../../widgets/my_background.dart';
import 'share_token_body.dart';

class ShareTokenPage extends StatelessWidget {
  const ShareTokenPage({super.key});
  static String route = '/ShareTokenPage';
  @override
  Widget build(BuildContext context) {
    return MyBackGround(
      backgroundColor: Palette.colorApp,
      titleAppBar: texts.label.shareCode,
      child: ShareTokenBody(),
    );
  }
}
