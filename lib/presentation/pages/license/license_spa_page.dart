import 'package:calendario/core/config/palette.dart';
import 'package:calendario/data/models/entities/response_model.dart';
import 'package:calendario/presentation/bloc/main_bloc.dart';
import 'package:calendario/presentation/pages/license/license_spa_bloc.dart';
import 'package:calendario/presentation/pages/license/license_spa_body.dart';
import 'package:calendario/presentation/widgets/my_background.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class LicenseSpaPage extends StatelessWidget {
  static String routeName = "/LicenseSpaPage";

  const LicenseSpaPage._();

  static Widget init(
    BuildContext context,
  ) {
    final blocLogin = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LicenseSpaBloc()..init(),
        ),
      ],
      child: const LicenseSpaPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Jiffy.locale("es");

    final bloc = Provider.of<LicenseSpaBloc>(context);
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      backPageEnable: !bloc.isLoading,
      titleAppBar: 'Licencia',
      isAppBar: false,
      backgroundColor: Palette.white,
      allAnchorwindow: true,
      child: const LicenseSpaBody(),
    );
  }
}
