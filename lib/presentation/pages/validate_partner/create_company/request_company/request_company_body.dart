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
import '../request_ofice/request_office_page.dart';
import 'request_company_bloc.dart';

class RequestCompanyBody extends StatelessWidget {
  const RequestCompanyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RequestCompanyBloc>(context, listen: true);
    final myLoading = MyLoading(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MyText(
              text: '¡Bienvenido!',
              size: SizeText.textLarge,
              color: Palette.colorApp,
            ),
            const MyText(
              text: 'Por favor registre su compañia',
              size: SizeText.text1,
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
                          text: bloc.companySearched?.businessName ?? '',
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
                          text: bloc.companySearched?.emailAddress ?? '',
                          color: Palette.colorApp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  if (!MyUtils.stringIsnullOrEmpty(
                      bloc.companySearched?.phoneNumber))
                    Row(
                      children: [
                        const MyText(text: 'Proveedor'),
                        MyText(text: bloc.companySearched?.businessName ?? ''),
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
                    text: 'Datos empresa',
                    size: SizeText.text3 - 1,
                    fontWeight: FontWeight.w500,
                  ),
                  const MySizedBoxHeight(),
                  MyTextFieldContainer(
                    controller: bloc.nameCompanyController,
                    title: 'Nombre de la compañia',
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  MyTextFieldContainer(
                    controller: bloc.legalNameController,
                    title: 'Nombre legal',
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  MyTextFieldContainer(
                    controller: bloc.webPageController,
                    title: 'Pagina web',
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  MyTextFieldContainer(
                    controller: bloc.phoneController,
                    title: 'Telefono',
                  ),
                ],
              ),
            ),
            MyCardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const MyText(
                    text: 'Datos de contacto',
                    size: SizeText.text3 - 1,
                    fontWeight: FontWeight.w500,
                  ),
                  const MySizedBoxHeight(),
                  MyTextFieldContainer(
                    controller: bloc.emailController,
                    title: 'Correo electronico',
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  // MyTextFieldContainer(
                  //   controller: bloc.adressController,
                  //   title: 'Dirección ',
                  // ),
                  // const MySizedBoxHeight(kDouble: 20),
                  MyTextFieldContainer(
                    controller: bloc.phoneContactController,
                    title: 'Telefono contacto',
                  ),
                  const MySizedBoxHeight(kDouble: 20),
                  MyTextFieldContainer(
                    controller: bloc.nameContactController,
                    title: 'Nombre de contacto',
                  ),
                ],
              ),
            ),
            const MySizedBoxHeight(kDouble: 20),
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
                    builder: (ctx) => RequestOfficePage.init(ctx,
                        company: bloc.companySearched!, request: request),
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
