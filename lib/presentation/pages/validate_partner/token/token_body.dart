// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_circle_icon_buttom.dart';
import '../../../widgets/my_loading_super.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../create_company/create_company_page.dart';
import '../login/login_page.dart';
import '../splash/splash_bloc.dart';
import 'token_bloc.dart';

class TokenBody extends StatelessWidget {
  const TokenBody({
    Key? key,
  }) : super(key: key);

  void _validar(BuildContext context, String token) async {
    final myLoading = MyLoading(context);
    final bloc = Provider.of<TokenBloc>(context, listen: false);
    myLoading.createLoading();
    // TypeLogin? valida = await bloc.validateToken('F55921ECA0');
    TypeLogin? valida = await bloc.validateToken(token);

    myLoading.dismiss();

    if (!context.mounted) return;
    switch (valida) {
      case TypeLogin.register:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => CreateCompanyPage.init(ctx)));
        return;
      case TypeLogin.login:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => LoginPage.init(ctx)));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TokenBloc>(context, listen: true);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Palette.colorApp,
        width: 2,
        style: BorderStyle.solid,
      ),
    );
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyText(
                    text: 'Bienvenido',
                    letterSpacing: 1,
                    textAlign: TextAlign.center,
                    color: Palette.colorApp,
                    size: 50,
                    fontWeight: FontWeight.w800,
                  ),
                  const MySizedBoxHeight(kDouble: 15),
                  const MyText(
                    text:
                        'Por favor ingresa tu clave de invitación para poder continuar.',
                    maxLines: 4,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    color: Palette.gray3,
                    size: SizeText.text3,
                  ),
                  const MySizedBoxHeight(kDouble: 20),
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
                            onTap: () async {
                              String? qr = await bloc.getQR();
                              if (qr == null) return;
                              // ignore: use_build_context_synchronously
                              if (!context.mounted) return;
                              return _validar(context, qr);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  TextField(
                    controller: bloc.tokenController,
                    cursorColor: Palette.colorApp,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Palette.colorApp,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      border: border,
                      focusedBorder: border,
                      isDense: true,
                      labelStyle: const TextStyle(
                        color: Palette.colorApp,
                        fontSize: 39,
                      ),
                    ),
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  MyButtom(
                    text: 'Continuar',
                    onTap: () => _validar(context, bloc.tokenController.text),
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                ],
              ),
            ),
          ),
        ),

        //
        //
        if (bloc.isLoading)
          Positioned.fill(
            child: Container(
              color: Palette.black.withOpacity(0.2),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Palette.colorApp,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
