import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_loading_super.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../../../widgets/textfield_general.dart';
import '../add_services_worker/add_servicesl_worker_page.dart';
import 'credential_worker_bloc.dart';

class CredentialWorkerBody extends StatelessWidget {
  const CredentialWorkerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CredentialWorkerBloc>(context);
    final myLoading = MyLoading(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MySizedBoxHeight(),
            MyText(
              text: bloc.business.businessName ?? '',
              color: Palette.colorApp,
              fontWeight: FontWeight.w700,
              size: SizeText.text3,
              maxLines: 2,
            ),
            const MySizedBoxHeight(),

            MyCardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  MyTextFieldContainer(
                    title: 'Usuario',
                    isImportantFormRed: true,
                    isEnabled: false,
                    isObscure: true,
                    controller: bloc.userController,
                  ),
                  const MySizedBoxHeight(),
                  MyTextFieldContainer(
                    title: 'Contraseña',
                    isImportantFormRed: true,
                    controller: bloc.passwordController,
                  ),
                  const MySizedBoxHeight(kDouble: 50),
                  MyButtom(
                    text: 'Registrar',
                    onTap: () async {
                      myLoading.createLoading();
                      final int? response = await bloc.registrar();
                      myLoading.dismiss();
                      if (response == null) return;
                      if (!context.mounted) return;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddServicesWorkerPage.init(context, response),
                          ));
                    },
                  ),
                ],
              ),
            )

            //

            //
            //
          ],
        ),
      ),
    );
  }
}
