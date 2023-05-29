import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/palette.dart';
import '../../../../data/models/entities/response_model.dart';
import '../../../../data/models/responses/person_response.dart';
import '../../../bloc/main_bloc.dart';
import '../../../widgets/my_background.dart';
import 'detail_worker_bloc.dart';
import 'detail_worker_body.dart';

class DetailWorkerPage extends StatelessWidget {
  const DetailWorkerPage._();
  static String routeName = '/DetailWorkerPage';

  static Widget init(
    BuildContext context,
    PersonResponse worker,
  ) {
    final main = Provider.of<MainBloc>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DetailWorkerBloc(
            login: main.login!,
            business: main.business!,
            worker: worker,
          )..init(),
        ),
      ],
      child: const DetailWorkerPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<DetailWorkerBloc>(context);
    ResponseModel.handleError(bloc, context);

    return MyBackGround(
      backPageEnable: !bloc.isLoading,
      titleAppBar: 'Detalle de empleado',
      actions: [
        IconButton(
          onPressed: () {
            //
          },
          icon: const Icon(
            Icons.edit,
            color: Palette.white,
          ),
        )
      ],
      isLoading: bloc.isLoading,
      isAppBar: true,
      backgroundColor: Palette.white,
      allAnchorwindow: true,
      child: const DetailWorkerBody(),
    );
  }
}
