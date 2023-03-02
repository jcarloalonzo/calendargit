import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../core/config/palette.dart';
import '../../../data/models/entities/response_model.dart';
import '../../bloc/main_bloc.dart';
import '../../widgets/my_background.dart';
import 'license_spa_bloc.dart';
import 'license_spa_body.dart';

class LicenseSpaPage extends StatelessWidget {
  const LicenseSpaPage._();
  static String routeName = '/LicenseSpaPage';

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
    Jiffy.locale('es');

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
