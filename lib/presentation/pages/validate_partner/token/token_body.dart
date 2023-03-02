import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../register/register_page.dart';
import 'token_bloc.dart';

class TokenBody extends StatelessWidget {
  const TokenBody({
    Key? key,
  }) : super(key: key);

  void _validar(BuildContext context) async {
    final bloc = Provider.of<TokenBloc>(context, listen: false);

    bool valida = await bloc.validar();
    if (valida) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => RegisterPage.init(ctx)));
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
                    text:
                        'Bienvenid@, por favor ingresa tu clave de invitación para poder continuar.',
                    maxLines: 4,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    color: Palette.gray3,
                    size: SizeText.text3,
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  const Icon(
                    Icons.admin_panel_settings_outlined,
                    size: 150,
                    color: Palette.colorApp,
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
                    height: 50,
                    onTap: () => _validar(context),
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
