import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_loading_super.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../../../widgets/textfield_general.dart';
import '../login/login_page.dart';
import 'create_company_bloc.dart';

class CreateCompanyBody extends StatelessWidget {
  const CreateCompanyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreateCompanyBloc>(context, listen: true);
    final myLoading = MyLoading(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
            const MySizedBoxHeight(kDouble: 40),
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
              controller: bloc.emailController,
              title: 'Correo electronico',
            ),
            const MySizedBoxHeight(kDouble: 20),
            MyTextFieldContainer(
              controller: bloc.adressController,
              title: 'Dirección ',
            ),
            const MySizedBoxHeight(kDouble: 20),
            MyTextFieldContainer(
              controller: bloc.phoneController,
              title: 'Telefono',
            ),
            const MySizedBoxHeight(kDouble: 20),
            MyTextFieldContainer(
              controller: bloc.nameContactController,
              title: 'Nombre de contacto',
            ),
            const MySizedBoxHeight(kDouble: 50),
            MyButtom(
              text: 'Registrar',
              onTap: () async {
                myLoading.createLoading();
                final valida = await bloc.createCompany();
                myLoading.dismiss();
                if (!valida) return;
                if (!context.mounted) return;
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => LoginPage.init(ctx)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
