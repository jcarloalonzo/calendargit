import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../config/app_config/palette.dart';
import '../../../../config/app_config/size_text.dart';
import '../../../../config/app_config/space_helpers.dart';
import '../../../../config/helpers/helpers.dart';
import '../../../../generated/translations.g.dart';
import '../../../domain/models/business.dart';
import '../../blocs/general/session/session_bloc.dart';
import '../../widgets/my_card_container.dart';
import '../../widgets/my_icon_buttom_circle.dart';
import '../../widgets/my_text.dart';

class ShareTokenBody extends StatelessWidget {
  const ShareTokenBody({super.key});
  @override
  Widget build(BuildContext context) {
    final Business? business = context.read<SessionBloc>().state.business;
    return Column(
      children: <Widget>[
        MyCardContainer(
          child: Column(
            children: [
              MyText(
                business?.businessName ?? '',
                color: Palette.black,
                maxLines: 3,
                size: SizeText.text2,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              SpaceHelpers.verticalNormal,
              MyText(
                texts.messages.yourSpaProviderCodeIsAFollows,
                color: Palette.colorApp,
                maxLines: 3,
                size: SizeText.text4,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              Center(
                child: QrImageView(
                  data: business?.codeuid ?? '',
                  version: QrVersions.auto,
                  size: 150.0,
                ),
              ),
              SpaceHelpers.verticalNormal,
              DottedBorder(
                strokeWidth: 1,
                color: Palette.colorApp,
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: const EdgeInsets.all(10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        business?.codeuid ?? '',
                        fontWeight: FontWeight.w600,
                        size: SizeText.text3,
                      ),
                    ],
                  ),
                ),
              ),
              SpaceHelpers.verticalNormal,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyIconButtomCircle(
                    icon: Icons.copy,
                    colorBackground: Palette.colorApp,
                    onTap: () async {
                      Clipboard.setData(
                          ClipboardData(text: business?.codeuid ?? ''));
                      Helpers.showSnackBar(context,
                          message: texts.messages.codeCopiedToClipboard);
                    },
                  ),
                  SpaceHelpers.horizontalNormal,
                  MyIconButtomCircle(
                    icon: Icons.share,
                    colorBackground: Palette.colorApp,
                    onTap: () async {
                      await Share.share(business?.codeuid ?? '',
                          subject: texts.messages.shareInvitationCode);
                    },
                  ),
                ],
              ),
              SpaceHelpers.verticalNormal,

              //
            ],
          ),
        ),
      ],
    );
  }
}
