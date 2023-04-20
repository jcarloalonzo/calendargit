import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../bloc/main_bloc.dart';
import '../../../widgets/my_background.dart';
import 'credential_worker_bloc.dart';
import 'credential_worker_body.dart';

class CredentialWorkerPage extends StatelessWidget {
  const CredentialWorkerPage._();
  static String routeName = '/CredentialWorkerPage';

  static Widget init(
    BuildContext context,
  ) {
    final main = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CredentialWorkerBloc(
            login: main.login!,
            business: main.business!,
          )..init(),
        ),
      ],
      child: const CredentialWorkerPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Jiffy.locale('es');

    final bloc = Provider.of<CredentialWorkerBloc>(context);
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      backPageEnable: !bloc.isLoading,
      titleAppBar: 'Agregar colaborador',
      isLoading: bloc.isLoading,
      isAppBar: true,
      backgroundColor: Palette.white,
      allAnchorwindow: true,
      child: const CredentialWorkerBody(),
    );
  }
}
