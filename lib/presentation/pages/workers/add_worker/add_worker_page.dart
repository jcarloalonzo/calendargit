import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../bloc/main_bloc.dart';
import '../../../widgets/my_background.dart';
import 'add_worker_bloc.dart';
import 'add_worker_body.dart';

class AddWorkerPage extends StatelessWidget {
  const AddWorkerPage._();
  static String routeName = '/AddWorkerPage';

  static Widget init(
    BuildContext context,
  ) {
    final main = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AddWorkerBloc(
            login: main.login!,
            business: main.business!,
          )..init(),
        ),
      ],
      child: const AddWorkerPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Jiffy.locale('es');

    final bloc = Provider.of<AddWorkerBloc>(context);
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      backPageEnable: !bloc.isLoading,
      titleAppBar: 'Agregar colaborador',
      isLoading: bloc.isLoading,
      isAppBar: true,
      backgroundColor: Palette.white,
      allAnchorwindow: true,
      child: const AddWorkerBody(),
    );
  }
}
