import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../bloc/main_bloc.dart';
import '../../widgets/my_background.dart';
import 'account_bloc.dart';
import 'account_body.dart';

class AccountPage extends StatelessWidget {
  const AccountPage._();
  static String routeName = '/AccountPage';

  static Widget init(
    BuildContext context,
  ) {
    final main = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AccountBloc(
            login: main.login!,
            business: main.business!,
          )..init(),
        ),
      ],
      child: const AccountPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Jiffy.locale('es');

    final bloc = Provider.of<AccountBloc>(context);
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      backPageEnable: !bloc.isLoading,
      titleAppBar: 'Mi cuenta',
      isLoading: bloc.isLoading,
      isAppBar: true,
      backgroundColor: Palette.white,
      allAnchorwindow: true,
      child: const AccountBody(),
    );
  }
}
