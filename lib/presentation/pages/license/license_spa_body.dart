import 'package:calendario/core/config/size_text.dart';
import 'package:calendario/presentation/pages/license/license_spa_bloc.dart';
import 'package:calendario/presentation/widgets/my_buttom.dart';
import 'package:calendario/presentation/widgets/my_icon_buttom_circle.dart';
import 'package:calendario/presentation/widgets/my_text.dart';
import 'package:calendario/presentation/widgets/mysizedbox.dart';
import 'package:calendario/presentation/widgets/textfield_general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LicenseSpaBody extends StatefulWidget {
  const LicenseSpaBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LicenseSpaBody> createState() => _HomeFacturaBodyState();
}

class _HomeFacturaBodyState extends State<LicenseSpaBody> {
  void initState() {
    super.initState();
    try {
      // Future.delayed(Duration.zero, () async {
      //   final bloc = Provider.of<GeneralBloc>(context, listen: false);
      //   await bloc.initPrintConfiguration();
      //   await bloc.initPlatformState(context);
      // });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LicenseSpaBloc>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //

            MySizedBoxHeight(
                kDouble: MediaQuery.of(context).size.height * 0.14),
            SvgPicture.asset(
              'assets/svg/license_page.svg',
              width: 180,
              fit: BoxFit.fill,
              height: 180,
            ),
            const MySizedBoxHeight(kDouble: 20),
            const MyText(
              text: 'Bienvenido!',
              size: SizeText.text1,
            ),
            const MyText(
              text: 'Ingrese el codigo de invitación para empezar',
              size: SizeText.text4,
            ),
            const MySizedBoxHeight(kDouble: 20),

            Row(
              children: const [
                Expanded(child: MyTextFieldContainer()),
                MySizedBoxWidth(),
                MyIconButtomCircle(icon: Icons.qr_code),
              ],
            ),
            const MySizedBoxHeight(kDouble: 20),

            MyButtom(
              text: 'Aceptar',
              onTap: () {
                //
              },
            )
          ],
        ),
      ),
    );
  }
}
