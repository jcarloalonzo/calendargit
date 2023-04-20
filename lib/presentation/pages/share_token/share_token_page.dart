import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../core/config/palette.dart';
import '../../../data/models/entities/response_model.dart';
import '../../bloc/main_bloc.dart';
import '../../widgets/my_background.dart';
import 'share_token_bloc.dart';
import 'share_token_body.dart';

class ShareTokenPage extends StatelessWidget {
  const ShareTokenPage._();
  static String routeName = '/ShareTokenPage';

  static Widget init(
    BuildContext context,
  ) {
    final main = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ShareTokenBloc(
            login: main.login!,
            business: main.business!,
          )..init(),
        ),
      ],
      child: const ShareTokenPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Jiffy.locale('es');

    final bloc = Provider.of<ShareTokenBloc>(context);
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      backPageEnable: !bloc.isLoading,
      titleAppBar: 'Compartir código',
      isAppBar: true,
      backgroundColor: Palette.colorApp,
      allAnchorwindow: true,
      child: const ShareTokenBody(),
    );
  }
}
