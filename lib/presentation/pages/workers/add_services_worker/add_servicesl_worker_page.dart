import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../bloc/main_bloc.dart';
import '../../../widgets/my_background.dart';
import 'add_services_worker_bloc.dart';
import 'add_services_worker_body.dart';

class AddServicesWorkerPage extends StatelessWidget {
  const AddServicesWorkerPage._();
  static String routeName = '/AddServicesWorkerPage';

  static Widget init(
    BuildContext context,
    int personID,
  ) {
    final main = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AddServicesWorkerBloc(
            login: main.login!,
            business: main.business!,
            personID: personID,
          )..init(),
        ),
      ],
      child: const AddServicesWorkerPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AddServicesWorkerBloc>(context);
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      backPageEnable: !bloc.isLoading,
      titleAppBar: 'Asignar servicios',
      isLoading: bloc.isLoading,
      isAppBar: true,
      backgroundColor: Palette.white,
      allAnchorwindow: true,
      child: const AddServicesWorkerBody(),
    );
  }
}
