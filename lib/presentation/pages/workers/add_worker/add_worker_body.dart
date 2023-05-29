import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../../data/models/requests/add_person_worker_request.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../../../widgets/textfield_general.dart';
import '../credential_worker/credential_worker_page.dart';
import 'add_worker_bloc.dart';

class AddWorkerBody extends StatelessWidget {
  const AddWorkerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AddWorkerBloc>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
                      title: 'Nro documento',
                      isImportantFormRed: true,
                      controller: bloc.nroDocumentoController,
                      textInputType: TextInputType.number,
                    ),
                    const MySizedBoxHeight(),
                    MyTextFieldContainer(
                      title: 'Nombre',
                      isImportantFormRed: true,
                      controller: bloc.nameController,
                      textCapitalization: TextCapitalization.characters,
                    ),
                    const MySizedBoxHeight(),
                    MyTextFieldContainer(
                      title: 'Apellido',
                      isImportantFormRed: true,
                      textCapitalization: TextCapitalization.characters,
                      controller: bloc.surnameController,
                    ),
                    const MySizedBoxHeight(),
                    MyTextFieldContainer(
                      title: 'Telefono',
                      controller: bloc.phoneController,
                    ),
                    const MySizedBoxHeight(),
                    MyTextFieldContainer(
                      title: 'Correo',
                      textCapitalization: TextCapitalization.characters,
                      controller: bloc.emailController,
                    ),
                    const MySizedBoxHeight(kDouble: 50),
                    MyButtom(
                      text: 'Continuar',
                      onTap: () async {
                        AddPersonWorkerRequest? request = bloc.getRequest();
                        if (request == null) return;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CredentialWorkerPage.init(context, request),
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
      ),
    );
  }
}
