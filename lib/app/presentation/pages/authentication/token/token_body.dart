// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/app_config/palette.dart';
import '../../../../../config/app_config/size_text.dart';
import '../../../../../config/app_config/space_helpers.dart';
import '../../../../../generated/translations.g.dart';
import '../../../../data/services/utils/barcode_scanner_custom.dart';
import '../../../blocs/authentication/token/token_bloc.dart';
import '../../../blocs/splash/splash_cubit.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_circle_icon_buttom.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/textfield_general.dart';
import '../../../widgets/util/loader.dart';
import '../create_company/request_company/request_company_page.dart';
import '../login/login_page.dart';

class TokenBody extends StatefulWidget {
  const TokenBody({super.key});

  @override
  State<TokenBody> createState() => _TokenBodyState();
}

class _TokenBodyState extends State<TokenBody> {
  late TextEditingController _qrTextController;

  @override
  void initState() {
    _initializeControllers();
    super.initState();
  }

  void _initializeControllers() {
    _qrTextController = TextEditingController();
  }

  @override
  void dispose() {
    _qrTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SpaceHelpers.verticalVeryLong,
        SpaceHelpers.verticalVeryLong,
        MyText(
          texts.label.welcome,
          textAlign: TextAlign.center,
          color: Palette.colorApp,
          size: 50,
          fontWeight: FontWeight.w800,
        ),
        SpaceHelpers.verticalNormal,
        MyText(
          texts.messages.pleaseEnterYourInvitationCodeToContinue,
          maxLines: 4,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
          color: Palette.gray3,
          size: SizeText.text3,
        ),
        SpaceHelpers.verticalNormal,
        Center(
          child: Stack(
            children: [
              const Icon(
                Icons.phone_android,
                size: 180,
                color: Palette.colorApp,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: MyCircleIconButtom(
                  icon: Icons.qr_code,
                  onTap: _onTapIconQR,
                ),
              ),
            ],
          ),
        ),
        SpaceHelpers.verticalNormal,
        MyTextField(
          textAlign: TextAlign.center,
          controller: _qrTextController,
          textCapitalization: TextCapitalization.characters,
        ),
        SpaceHelpers.verticalNormal,
        MyButtom(
          texts.label.continu,
          onTap: _onTapContinue,
        ),
      ],
    );
  }

  void _onTapIconQR() async {
    // String? qr = await bloc.getQR();
    String? qr = await BarcodeScannerCustom.getQR();
    if (qr == null) return;
    if (!context.mounted) return;
    _qrTextController.text = qr.trim();
    setState(() {});
    // return _validar(context, qr);
  }

  void _onTapContinue() async {
    FocusScope.of(context).unfocus();
    final code = _qrTextController.text.trim().toUpperCase();
    final bloc = context.read<TokenBloc>();
    final TypeLogin? response =
        await Loader.showLoader(context, bloc.process(token: code));
    if (!context.mounted) return;
    if (response == null) return;

    // Llevando a la pagina según corresponda..
    switch (response) {
      case TypeLogin.register:
        context.go(RequestCompanyPage.route);
        return;
      case TypeLogin.login:
        context.go(LoginPage.route);
        return;
      default:
    }
  }
}
