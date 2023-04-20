import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../core/config/size_text.dart';
import '../../../widgets/my_buttom.dart';
import '../../../widgets/my_card_container.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/mysizedbox.dart';
import '../../../widgets/textfield_general.dart';
import 'add_worker_bloc.dart';

class AddWorkerBody extends StatelessWidget {
  const AddWorkerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AddWorkerBloc>(context);

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
                  const MyTextFieldContainer(
                    title: 'Nro documento',
                    isImportantFormRed: true,
                  ),
                  const MySizedBoxHeight(),
                  const MyTextFieldContainer(
                    title: 'Nombre',
                    isImportantFormRed: true,
                  ),
                  const MySizedBoxHeight(),
                  const MyTextFieldContainer(
                    title: 'Apellido',
                    isImportantFormRed: true,
                  ),
                  const MySizedBoxHeight(),
                  const MyTextFieldContainer(
                    title: 'Telefono',
                  ),
                  const MySizedBoxHeight(),
                  const MyTextFieldContainer(
                    title: 'Correo',
                  ),
                  const MySizedBoxHeight(),
                  MyButtom(
                    text: 'Continuar',
                    onTap: () async {
                      //
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
