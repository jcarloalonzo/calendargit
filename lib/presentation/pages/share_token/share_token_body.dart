import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/config/palette.dart';
import '../../../core/config/size_text.dart';
import '../../../data/models/responses/business_response.dart';
import '../../widgets/my_card_container.dart';
import '../../widgets/my_icon_buttom_circle copy.dart';
import '../../widgets/my_text.dart';
import '../../widgets/mysizedbox.dart';
import 'share_token_bloc.dart';

class ShareTokenBody extends StatelessWidget {
  const ShareTokenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ShareTokenBloc>(context);
    final BusinessResponse company = bloc.business;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //
            MyCardContainer(
              child: Column(
                children: [
                  MyText(
                    text: company.businessName ?? '',
                    color: Palette.black,
                    maxLines: 3,
                    size: SizeText.text2,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                  const MySizedBoxHeight(),
                  const MyText(
                    text: 'Tú codigo de proveedor SPA, es el siguiente:',
                    color: Palette.colorApp,
                    maxLines: 3,
                    size: SizeText.text4,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    child: QrImageView(
                      data: company.codeuid ?? '',
                      version: QrVersions.auto,
                      size: 150.0,
                    ),
                  ),
                  const MySizedBoxHeight(),
                  DottedBorder(
                    strokeWidth: 1,
                    color: Palette.colorApp,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: company.codeuid ?? '',
                            fontWeight: FontWeight.w600,
                            size: SizeText.text3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIconButtomCircle(
                        icon: Icons.copy,
                        colorBackground: Palette.colorApp,
                        onTap: () async {
                          Clipboard.setData(
                              ClipboardData(text: company.codeuid ?? ''));
                          await Fluttertoast.showToast(
                              msg: 'Código copiado al portapapeles.',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Palette.black,
                              textColor: Colors.white,
                              fontSize: 14.0);
                        },
                      ),
                      const MySizedBoxWidth(),
                      MyIconButtomCircle(
                        icon: Icons.share,
                        colorBackground: Palette.colorApp,
                        onTap: () async {
                          await Share.share(company.codeuid ?? '',
                              subject: 'Compartir código de invitación');
                        },
                      ),
                    ],
                  ),
                  const MySizedBoxHeight(kDouble: 20),

                  //
                ],
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
