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
import '../request_login/request_login_page.dart';
import 'request_office_bloc.dart';

class RequestOfficeBody extends StatelessWidget {
  const RequestOfficeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RequestOfficeBloc>(context, listen: true);
    final myLoading = MyLoading(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MyText(
              text: 'Oficina',
              size: SizeText.textLarge,
              color: Palette.colorApp,
            ),
            const MyText(
              text: 'Por favor registre su oficina principal',
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
                    text: 'Datos Oficina',
                    size: SizeText.text3 - 1,
                    fontWeight: FontWeight.w500,
                  ),
                  const MySizedBoxHeight(),
                  MyTextFieldContainer(
                    controller: bloc.nameOfficeController,
                    isImportantFormRed: true,
                    title: 'Nombre oficina',
                    textCapitalization: TextCapitalization.characters,
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  MyTextFieldContainer(
                    controller: bloc.addressOfficeController,
                    isEnabled: false,
                    title: 'Dirección',
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  MyTextFieldContainer(
                    controller: bloc.phoneOfficeController,
                    title: 'Telefono',
                  ),
                  const MySizedBoxHeight(kDouble: 20),
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
              text: 'Continuar',
              onTap: () async {
                myLoading.createLoading();
                CreateCompanyRequest? request = bloc.getRequestCompany();
                myLoading.dismiss();
                if (request == null) return;
                if (!context.mounted) return;

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => RequestLoginPage.init(ctx,
                        company: bloc.company!, request: request),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
