import 'package:flutter/material.dart';

import '../../../core/config/size_text.dart';
import '../../widgets/my_text.dart';
import '../../widgets/mysizedbox.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final blocHome = Provider.of<HomeBloc>(context, listen: false);
    // final blocLogin = Provider.of<MainBloc>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          MySizedBoxHeight(),

          MyText(
            text: 'Mi cuenta',
            fontWeight: FontWeight.w600,
            color: Colors.black,
            size: SizeText.text3,
          ),
          MySizedBoxHeight(),

          // const SizedBox(height: 15),
          // Row(
          //   children:   [
          //     MyText(
          //       text: 'Bienvenid@ ${blocLogin.model!.name}',
          //       fontWeight: FontWeight.w400,
          //     )
          //   ],
          // ),
          // const SizedBox(height: 15),
          // TitleHombe(
          //   title: 'Tenemos para hoy',
          //   date: Config.formatDate(DateTime.now(), 'dd/MM/yy'),
          // ),
          // const SizedBox(height: 15),
          // HomeCard(service: blocHome.cardnow),
          // const SizedBox(height: 30),
          // TitleHombe(
          //   title: 'Para mañana',
          //   date: Config.formatDate(
          //       DateTime.now().add(const Duration(days: 1)), 'dd/MM/yy'),
          // ),
          // const SizedBox(height: 15),
          // HomeCard(service: blocHome.cardafter),
        ],
      ),
    );
  }
}
