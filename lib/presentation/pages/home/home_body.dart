import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/palette.dart';
import '../../../core/config/size_text.dart';
import '../../bloc/main_bloc.dart';
import '../../widgets/my_text.dart';
import '../../widgets/mysizedbox.dart';
import '../invoice/new_invoice_free/invoice_free_page.dart';
import 'home_widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocLogin = Provider.of<MainBloc>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MySizedBoxHeight(kDouble: 20),
          Row(
            children: [
              const MyText(
                text: 'Bienvenido, ',
                fontWeight: FontWeight.w600,
                color: Colors.black,
                size: SizeText.text3,
              ),
              MyText(
                text: blocLogin.model?.name ?? '',
                fontWeight: FontWeight.w600,
                color: Palette.blue3,
                size: SizeText.text3,
              ),
            ],
          ),
          const MySizedBoxHeight(),
          const CardHomeList(),
          const MySizedBoxHeight(),
          const MyText(
            text: '¿Que deseas hacer?',
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          const MySizedBoxHeight(),
          const _ListCardHomeColumn(),
        ],
      ),
    );
  }
}

class _ListCardHomeColumn extends StatelessWidget {
  const _ListCardHomeColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ListCardHome(
        //   title: 'Realiza una reserva',
        //   subTitle: '¿Deseas reservar una cita?',
        //   icono: Icons.assignment_ind_outlined,
        //   colorIcono: Palette.blue1,
        //   onTap: () => Navigator.pushNamed(
        //       context, ScheduleReservationFreePage.routeName),
        // ),

        ListCardHome(
          title: 'Emitir Invoice',
          subTitle: 'Puedes emitir un invoice rápido',
          icono: Icons.request_quote_outlined,
          colorIcono: Palette.red,
          onTap: () => Navigator.pushNamed(context, InvoiceFreePage.routeName),
        ),
      ],
    );
  }
}
