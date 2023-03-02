import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/entities/response_model.dart';
import '../../../widgets/my_background.dart';
import 'token_bloc.dart';
import 'token_body.dart';

class TokenPage extends StatelessWidget {
  const TokenPage._();
  static Widget init(
    BuildContext context,
  ) {
    return ChangeNotifierProvider(
      create: (_) => TokenBloc()..init(context),
      child: const TokenPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TokenBloc>(context, listen: true);
    ResponseModel.handleError(bloc, context);

    return const SafeArea(
      child: MyBackGround(
        isDrawer: false,
        titleAppBar: 'Validar Clave',
        isAppBar: false,
        allAnchorwindow: true,
        child: TokenBody(),
      ),
    );
  }
}
