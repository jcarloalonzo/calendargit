import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../bloc/main_bloc.dart';
import '../../../widgets/my_background.dart';
import '../add_worker/add_worker_page.dart';
import 'workers_bloc.dart';
import 'workers_body.dart';

class WorkersPage extends StatelessWidget {
  const WorkersPage._();
  static String routeName = '/WorkersPage';

  static Widget init(
    BuildContext context,
  ) {
    final main = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WorkersBloc(
            login: main.login!,
            business: main.business!,
          )..init(),
        ),
      ],
      child: const WorkersPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Jiffy.locale('es');

    final bloc = Provider.of<WorkersBloc>(context);
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      backPageEnable: !bloc.isLoading,
      titleAppBar: 'Colaboradores',
      isLoading: bloc.isLoading,
      isAppBar: true,
      backgroundColor: Palette.white,
      allAnchorwindow: true,
      wFloatingActionButtom: FloatingActionButton(
        backgroundColor: Palette.colorApp,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddWorkerPage.init(context),
              ));
        },
        child: const Icon(Icons.add),
      ),
      child: const WorkersBody(),
    );
  }
}
