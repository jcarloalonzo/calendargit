import 'package:calendario/core/config/palette.dart';
import 'package:calendario/presentation/bloc/liquidation_bloc.dart';
import 'package:calendario/presentation/bloc/main_bloc.dart';
import 'package:calendario/presentation/widgets/confirm_alternate.dart';
import 'package:calendario/presentation/widgets/my_background.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'liquidation_body.dart';

class LiquidationPage extends StatelessWidget {
  const LiquidationPage._();

  static Widget init(BuildContext context) {
    final blocLogin = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LiquidationBloc()
            ..init(
                userID: blocLogin.model!.userId!,
                businessID: blocLogin.modelBusiness!.businessId!,
                liqDate: DateTime.now()),
        ),
      ],
      child: const LiquidationPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LiquidationBloc>(context, listen: true);

    if (bloc.responseModel != null) {
      if (bloc.responseModel!.statusCode != 200) {
        Future.delayed(Duration.zero, () async {
          confirmAlternantError(
              context: context,
              errormodel: bloc.responseModel!.error!,
              statuscode: bloc.responseModel!.statusCode!);
          bloc.responseModel = null;
        });
      }
    }

    return MyBackGround(
// allAnchorwindow: true,
      isDrawer: false,
      // isAppBar: false,
      titleAppBar: 'Reserva Online',
      actions: [
        IconButton(
          icon: const Icon(
            Icons.print,
            color: Palette.gray1,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            MdiIcons.fileExcel,
            color: Colors.green,
          ),
          onPressed: () async {
            await getexcel(context);
          },
        ),
      ],
      child: (bloc.isLoading)
          ? const Center(child: CircularProgressIndicator())
          : const LiquidationBody(),
    );
  }

  Future<void> getexcel(BuildContext context) async {
    final bloc = Provider.of<LiquidationBloc>(context, listen: false);
    final str = await bloc.getReportExcel();

    if (str.isNotEmpty) {
      String fp = await bloc.setFile64xls(str);
      Share.shareFiles([fp], text: 'Reporte Liquidación');
    }
  }
}
