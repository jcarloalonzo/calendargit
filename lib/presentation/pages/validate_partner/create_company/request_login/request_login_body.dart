import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/config/Utils.dart';
import '../../../../../core/config/palette.dart';
import '../../../../../core/config/size_text.dart';
import '../../../../../data/models/requests/create_company_request.dart';
import '../../../../widgets/my_buttom.dart';
import '../../../../widgets/my_card_container.dart';
import '../../../../widgets/my_loading_super.dart';
import '../../../../widgets/my_text.dart';
import '../../../../widgets/mysizedbox.dart';
import '../../../../widgets/textfield_general.dart';
import '../categories_subscription/categories_subscription_page.dart';
import 'request_login_bloc.dart';

class RequestLoginBody extends StatelessWidget {
  const RequestLoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RequestLoginBloc>(context, listen: true);
    final myLoading = MyLoading(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MyText(
              text: 'Usuario admin',
              size: SizeText.textLarge,
              color: Palette.colorApp,
            ),
            const MyText(
              text: 'Está a un solo paso, por favor registre el administrador.',
              size: SizeText.text2,
              maxLines: 3,
              color: Palette.colorApp,
            ),
            MyCardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      const MyText(text: 'Proveedor'),
                      const MySizedBoxWidth(),
                      Flexible(
                        child: MyText(
                          maxLines: 3,
                          text: bloc.company?.businessName ?? '',
                          color: Palette.colorApp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const MyText(text: 'Correo'),
                      const MySizedBoxWidth(),
                      Flexible(
                        child: MyText(
                          maxLines: 3,
                          text: bloc.company?.emailAddress ?? '',
                          color: Palette.colorApp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  if (!MyUtils.stringIsnullOrEmpty(bloc.company?.phoneNumber))
                    Row(
                      children: [
                        const MyText(text: 'Proveedor'),
                        MyText(text: bloc.company?.businessName ?? ''),
                      ],
                    ),
                ],
              ),
            ),
            MyCardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const MyText(
                    text: 'Registro',
                    size: SizeText.text3,
                    fontWeight: FontWeight.w500,
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  MyTextFieldContainer(
                    controller: bloc.userController,
                    isImportantFormRed: true,
                    title: 'Usuario',
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  MyTextFieldContainer(
                    isPassword: bloc.isHidden,
                    isImportantFormRed: true,
                    controller: bloc.passwordController,
                    title: 'Contrasena',
                    suffixIcon: GestureDetector(
                      onTap: () => bloc.isHidden = true,
                      child: Icon(
                        bloc.isHidden
                            ? Icons.enhanced_encryption
                            : Icons.no_encryption_outlined,
                        color: Palette.colorApp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const MySizedBoxHeight(kDouble: 50),
            // MyButtom(
            //   text: 'Continuar',
            //   onTap: () async {
            //     myLoading.createLoading();
            //     final valida = await bloc.createCompany();
            //     myLoading.dismiss();
            //     if (!valida) return;
            //     if (!context.mounted) return;
            //     Navigator.of(context).pushReplacement(
            //         MaterialPageRoute(builder: (ctx) => LoginPage.init(ctx)));
            //   },
            // ),
            MyButtom(
              text: 'CONTINUAR',
              onTap: () async {
                try {
                  myLoading.createLoading();
                  CreateCompanyRequest? request = bloc.getRequestCompany();
                  myLoading.dismiss();
                  if (request == null) return;
                  if (!context.mounted) return;

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => CategoriesSubscriptionPage.init(ctx,
                          company: bloc.company!, request: request),
                    ),
                  );
//
//
//

                  // final prefs = PreferencesUser();
                  // final mainBloc = context.read<MainBloc>();

                  // myLoading.createLoading();
                  // bool? valida = await bloc.register();
                  // myLoading.dismiss();
                  // if (!valida) return;
                  // // if (request == null) return;
                  // if (!context.mounted) return;

                  // final business = prefs.business;

                  // mainBloc.business =
                  //     BusinessResponse.businessResponseFromJson(business!);

                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(
                  //     builder: (ctx) => LoginPage.init(
                  //       ctx,
                  //     ),
                  //   ),
                  //   (route) => false,
                  // );
                } catch (e) {
                  bloc.setError(e.toString());
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
